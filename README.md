# R-PASS

R-PASS is a Flutter Web client for the shared R-CORE Supabase environment.
The production image contains only the compiled web application and Nginx; it
does **not** start a database or Supabase service.

## Demo mode (default)

With `DEMO_MODE=true` (the default in `.env.example`) the app is a pure visual
demo: it uses built-in mock data (companies, managers, blacklist records),
needs **no** Supabase, accepts any login/password and saves nothing. Quick
start:

```bash
cp .env.example .env
docker compose up -d --build
# open http://<server>:8080 and log in with any credentials
```

To switch to the real backend set `DEMO_MODE=false`, fill in `SUPABASE_URL`
and `SUPABASE_ANON_KEY`, and rebuild. The rest of this guide describes that
real deployment.

## Prerequisites

- Ubuntu Server with Docker Engine and the Docker Compose plugin.
- Network access from the server and browser clients to the shared R-CORE
  Supabase endpoint.
- A Supabase **anon/publishable** key for the R-CORE project. Never put a
  `service_role` or other secret key in this application.

## First deployment

1. Clone or copy the project to the server:

   ```bash
   git clone <R-PASS-repository-url> r-pass
   cd r-pass
   ```

2. Create the private deployment configuration and protect it:

   ```bash
   cp .env.example .env
   chmod 600 .env
   ```

3. Edit `.env`: set `DEMO_MODE=false`, `SUPABASE_URL` to the shared R-CORE URL
   (without a trailing slash) and `SUPABASE_ANON_KEY` to its browser
   anon/publishable key. Set `R_PASS_PORT` to an unused server port, for
   example `8080`. Set the public FlutterFlow asset URL and the support,
   WhatsApp, and IP service URLs as appropriate for the installation.

   Docker passes these values to `flutter build web` as Dart defines. This is
   required because a Flutter Web application is static: changing `.env`
   requires rebuilding the image. The anon/publishable key is visible in the
   browser bundle by design; access control must be enforced by Supabase RLS.

4. Apply [the tenant RLS migration](supabase/migrations/20261017_rpass_tenant_rls.sql)
   to the shared R-CORE Supabase project using the SQL Editor or the
   Supabase CLI:

   ```bash
   supabase db push
   ```

   Review the migration against the shared schema before applying it. It
   expects UUID columns `profiles.company_id`, `bl_company.id`,
   `bl_blacklist.id_company`, and `bl_files.company_id`. It also adds the
   tenant-scoped `get_blacklist_count_by_company(uuid)` RPC required by the
   dashboard. Ensure that `get_recent_blacklist_count_by_company`,
   `search_blacklist`, `extend_company_subscription`, and all Edge Functions validate
   `auth.uid()` and tenant ownership server-side.

   If `user_and_company_details` is a PostgreSQL 15+ view, enable
   `security_invoker` as noted in the migration so the view cannot bypass
   the policies of its underlying tables. Add equivalent RLS policies for
   any additional R-CORE tables or Storage buckets.

5. Build and start the web application:

   ```bash
   docker compose up -d --build
   ```

6. Verify its state and open it:

   ```bash
   docker compose ps
   curl -I http://127.0.0.1:${R_PASS_PORT:-8080}/
   ```

   The application is available at `http://<server-ip>:<R_PASS_PORT>/`.
   For public access, put the container behind the server's existing HTTPS
   reverse proxy and forward the selected port. Nginx in the container
   already serves Flutter routes with an SPA fallback.

## Updating and rollback

To deploy a newer revision:

```bash
git pull
docker compose up -d --build
```

To stop it:

```bash
docker compose down
```

The current image has no persistent local data; all application data remains
in R-CORE Supabase.

## Security and tenant model

- Browser code adds `company_id`/`id_company` filters to company-scoped
  profiles and blacklist records. This is a UX and efficiency measure, not a
  security boundary.
- RLS in the shared Supabase project is mandatory. The migration is the
  actual tenant boundary; it derives the company from `auth.uid()` and blocks
  cross-company reads and writes.
- Only `super_admin` may access the global company count and cross-company
  administration. Do not grant direct table privileges or service-role keys
  to browser clients.
- Store local `.env` files outside version control. `.env.example` contains
  placeholders only.
