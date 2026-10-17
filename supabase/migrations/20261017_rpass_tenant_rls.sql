-- Apply this migration to the shared R-CORE Supabase project before exposing
-- R-PASS. It assumes UUID tenant columns already used by the application.

create or replace function public.current_company_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select company_id
  from public.profiles
  where id = auth.uid()
$$;

create or replace function public.is_rpass_super_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select coalesce(
    (
      select role = 'super_admin'
      from public.profiles
      where id = auth.uid()
    ),
    false
  )
$$;

alter table public.profiles enable row level security;
alter table public.bl_company enable row level security;
alter table public.bl_blacklist enable row level security;
alter table public.bl_files enable row level security;

drop policy if exists rpass_profiles_select on public.profiles;
create policy rpass_profiles_select on public.profiles
  for select
  using (
    id = auth.uid()
    or company_id = public.current_company_id()
    or public.is_rpass_super_admin()
  );

drop policy if exists rpass_profiles_update on public.profiles;
create policy rpass_profiles_update on public.profiles
  for update
  using (
    id = auth.uid()
    or company_id = public.current_company_id()
    or public.is_rpass_super_admin()
  )
  with check (
    company_id is null
    or company_id = public.current_company_id()
    or public.is_rpass_super_admin()
  );

drop policy if exists rpass_profiles_insert on public.profiles;
create policy rpass_profiles_insert on public.profiles
  for insert
  with check (
    id = auth.uid()
    and company_id is null
  );

drop policy if exists rpass_companies_tenant_access on public.bl_company;
create policy rpass_companies_tenant_access on public.bl_company
  for all
  using (
    id = public.current_company_id()
    or public.is_rpass_super_admin()
  )
  with check (
    id = public.current_company_id()
    or public.is_rpass_super_admin()
  );

drop policy if exists rpass_blacklist_tenant_access on public.bl_blacklist;
create policy rpass_blacklist_tenant_access on public.bl_blacklist
  for all
  using (
    id_company = public.current_company_id()
    or public.is_rpass_super_admin()
  )
  with check (
    id_company = public.current_company_id()
    or public.is_rpass_super_admin()
  );

drop policy if exists rpass_files_tenant_access on public.bl_files;
create policy rpass_files_tenant_access on public.bl_files
  for all
  using (
    company_id = public.current_company_id()
    or public.is_rpass_super_admin()
  )
  with check (
    company_id = public.current_company_id()
    or public.is_rpass_super_admin()
  );

create or replace function public.get_blacklist_count_by_company(
  p_company_id uuid
)
returns bigint
language sql
stable
security invoker
set search_path = public
as $$
  select count(*)
  from public.bl_blacklist
  where id_company = p_company_id
    and in_arhive is false
$$;

grant execute on function public.get_blacklist_count_by_company(uuid) to authenticated;

-- user_and_company_details is a view. On PostgreSQL 15+, ensure it respects
-- the caller's RLS policies rather than the view owner's privileges:
-- alter view public.user_and_company_details set (security_invoker = true);
