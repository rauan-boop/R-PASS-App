-- R-PASS standalone schema. These bl_* tables are separate from the legacy
-- R-CORE tables (bl_company, bl_blacklist, etc.) used by the current demo.

create table if not exists public.bl_companies (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  bin varchar(12) not null,
  status text not null default 'trial',
  created_at timestamptz not null default now(),
  constraint bl_companies_bin_format check (bin ~ '^[0-9]{12}$'),
  constraint bl_companies_bin_unique unique (bin),
  constraint bl_companies_status_check
    check (status in ('active', 'trial', 'expired'))
);

create table if not exists public.bl_users (
  id uuid primary key default gen_random_uuid(),
  company_id uuid not null
    references public.bl_companies(id) on delete cascade,
  full_name text not null,
  phone varchar(20) not null,
  role text not null default 'manager',
  auth_user_id uuid unique
    references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  constraint bl_users_phone_unique unique (phone),
  constraint bl_users_role_check check (role in ('admin', 'manager'))
);

create table if not exists public.bl_clients (
  id uuid primary key default gen_random_uuid(),
  iin varchar(12) not null,
  full_name text,
  document_number text,
  phone varchar(20),
  last_check_date timestamptz,
  created_at timestamptz not null default now(),
  constraint bl_clients_iin_format check (iin ~ '^[0-9]{12}$'),
  constraint bl_clients_iin_unique unique (iin)
);

create table if not exists public.bl_incidents (
  id uuid primary key default gen_random_uuid(),
  client_iin varchar(12) not null
    references public.bl_clients(iin) on delete restrict,
  company_id uuid not null
    references public.bl_companies(id) on delete cascade,
  reported_by_user_id uuid
    references public.bl_users(id) on delete set null,
  category text not null,
  risk_level text not null,
  description text,
  moderation_status text not null default 'pending',
  created_at timestamptz not null default now(),
  constraint bl_incidents_client_iin_format
    check (client_iin ~ '^[0-9]{12}$'),
  constraint bl_incidents_category_check
    check (category in (
      'fraud', 'accident', 'debt', 'theft', 'dirty_salon', 'other'
    )),
  constraint bl_incidents_risk_level_check
    check (risk_level in ('high', 'medium', 'low')),
  constraint bl_incidents_moderation_status_check
    check (moderation_status in ('pending', 'approved', 'rejected'))
);

-- UNIQUE constraints above provide the IIN, BIN, and phone lookup indexes.
create index if not exists bl_users_company_id_idx
  on public.bl_users(company_id);
create index if not exists bl_incidents_client_iin_idx
  on public.bl_incidents(client_iin);
create index if not exists bl_incidents_company_created_at_idx
  on public.bl_incidents(company_id, created_at desc);
create index if not exists bl_incidents_moderation_status_idx
  on public.bl_incidents(moderation_status);

create or replace function public.bl_rpass_current_company_id()
returns uuid
language sql
stable
security definer
set search_path = pg_catalog, public
as $$
  select u.company_id
  from public.bl_users as u
  where u.auth_user_id = auth.uid()
  limit 1
$$;

create or replace function public.bl_rpass_current_user_id()
returns uuid
language sql
stable
security definer
set search_path = pg_catalog, public
as $$
  select u.id
  from public.bl_users as u
  where u.auth_user_id = auth.uid()
  limit 1
$$;

create or replace function public.bl_rpass_is_company_admin()
returns boolean
language sql
stable
security definer
set search_path = pg_catalog, public
as $$
  select exists (
    select 1
    from public.bl_users as u
    where u.auth_user_id = auth.uid()
      and u.role = 'admin'
  )
$$;

create or replace function public.bl_rpass_has_active_company()
returns boolean
language sql
stable
security definer
set search_path = pg_catalog, public
as $$
  select exists (
    select 1
    from public.bl_users as u
    join public.bl_companies as c on c.id = u.company_id
    where u.auth_user_id = auth.uid()
      and c.status in ('active', 'trial')
  )
$$;

create or replace function public.bl_rpass_is_super_admin()
returns boolean
language sql
stable
security invoker
set search_path = pg_catalog
as $$
  select coalesce(auth.jwt() -> 'app_metadata' ->> 'role' = 'super_admin', false)
$$;

revoke all on function public.bl_rpass_current_company_id() from public;
revoke all on function public.bl_rpass_current_user_id() from public;
revoke all on function public.bl_rpass_is_company_admin() from public;
revoke all on function public.bl_rpass_has_active_company() from public;
revoke all on function public.bl_rpass_is_super_admin() from public;
grant execute on function public.bl_rpass_current_company_id() to authenticated;
grant execute on function public.bl_rpass_current_user_id() to authenticated;
grant execute on function public.bl_rpass_is_company_admin() to authenticated;
grant execute on function public.bl_rpass_has_active_company() to authenticated;
grant execute on function public.bl_rpass_is_super_admin() to authenticated;

alter table public.bl_companies enable row level security;
alter table public.bl_users enable row level security;
alter table public.bl_clients enable row level security;
alter table public.bl_incidents enable row level security;

drop policy if exists bl_companies_select on public.bl_companies;
create policy bl_companies_select on public.bl_companies
  for select to authenticated
  using (
    id = public.bl_rpass_current_company_id()
    or public.bl_rpass_is_super_admin()
  );

drop policy if exists bl_companies_super_admin_manage on public.bl_companies;
create policy bl_companies_super_admin_manage on public.bl_companies
  for all to authenticated
  using (public.bl_rpass_is_super_admin())
  with check (public.bl_rpass_is_super_admin());

drop policy if exists bl_users_select_company on public.bl_users;
create policy bl_users_select_company on public.bl_users
  for select to authenticated
  using (
    company_id = public.bl_rpass_current_company_id()
    or auth_user_id = auth.uid()
    or public.bl_rpass_is_super_admin()
  );

drop policy if exists bl_users_admin_manage on public.bl_users;
create policy bl_users_admin_manage on public.bl_users
  for all to authenticated
  using (
    company_id = public.bl_rpass_current_company_id()
    and public.bl_rpass_is_company_admin()
  )
  with check (
    company_id = public.bl_rpass_current_company_id()
    and public.bl_rpass_is_company_admin()
  );

drop policy if exists bl_users_super_admin_manage on public.bl_users;
create policy bl_users_super_admin_manage on public.bl_users
  for all to authenticated
  using (public.bl_rpass_is_super_admin())
  with check (public.bl_rpass_is_super_admin());

drop policy if exists bl_clients_member_select on public.bl_clients;
create policy bl_clients_member_select on public.bl_clients
  for select to authenticated
  using (
    exists (
      select 1
      from public.bl_incidents as i
      where i.client_iin = bl_clients.iin
        and (
          i.company_id = public.bl_rpass_current_company_id()
          or (
            i.moderation_status = 'approved'
            and public.bl_rpass_has_active_company()
          )
        )
    )
    or public.bl_rpass_is_super_admin()
  );

drop policy if exists bl_clients_super_admin_update on public.bl_clients;
create policy bl_clients_super_admin_update on public.bl_clients
  for update to authenticated
  using (public.bl_rpass_is_super_admin())
  with check (public.bl_rpass_is_super_admin());

drop policy if exists bl_clients_super_admin_delete on public.bl_clients;
create policy bl_clients_super_admin_delete on public.bl_clients
  for delete to authenticated
  using (public.bl_rpass_is_super_admin());

drop policy if exists bl_incidents_select_company_or_approved
  on public.bl_incidents;
create policy bl_incidents_select_company_or_approved on public.bl_incidents
  for select to authenticated
  using (
    company_id = public.bl_rpass_current_company_id()
    or (
      moderation_status = 'approved'
      and public.bl_rpass_has_active_company()
    )
    or public.bl_rpass_is_super_admin()
  );

drop policy if exists bl_incidents_member_insert on public.bl_incidents;
create policy bl_incidents_member_insert on public.bl_incidents
  for insert to authenticated
  with check (
    company_id = public.bl_rpass_current_company_id()
    and reported_by_user_id = public.bl_rpass_current_user_id()
    and public.bl_rpass_has_active_company()
  );

drop policy if exists bl_incidents_admin_update on public.bl_incidents;
create policy bl_incidents_admin_update on public.bl_incidents
  for update to authenticated
  using (
    company_id = public.bl_rpass_current_company_id()
    and public.bl_rpass_is_company_admin()
  )
  with check (
    company_id = public.bl_rpass_current_company_id()
    and public.bl_rpass_is_company_admin()
    and (
      reported_by_user_id is null
      or exists (
        select 1
        from public.bl_users as u
        where u.id = bl_incidents.reported_by_user_id
          and u.company_id = bl_incidents.company_id
      )
    )
  );

drop policy if exists bl_incidents_admin_delete on public.bl_incidents;
create policy bl_incidents_admin_delete on public.bl_incidents
  for delete to authenticated
  using (
    company_id = public.bl_rpass_current_company_id()
    and public.bl_rpass_is_company_admin()
  );

drop policy if exists bl_incidents_super_admin_manage on public.bl_incidents;
create policy bl_incidents_super_admin_manage on public.bl_incidents
  for all to authenticated
  using (public.bl_rpass_is_super_admin())
  with check (public.bl_rpass_is_super_admin());

revoke all on public.bl_companies, public.bl_users,
  public.bl_clients, public.bl_incidents from anon, authenticated;
grant select, insert, update, delete on public.bl_companies,
  public.bl_users, public.bl_clients, public.bl_incidents to authenticated;
grant all on public.bl_companies, public.bl_users,
  public.bl_clients, public.bl_incidents to service_role;
