FROM ghcr.io/cirruslabs/flutter:3.24.5 AS build

WORKDIR /app

ARG DEMO_MODE=true
ARG SUPABASE_URL=
ARG SUPABASE_ANON_KEY=
ARG FLUTTERFLOW_ASSETS_BASE_URL=
ARG TELEGRAM_SUPPORT_URL=
ARG WHATSAPP_BASE_URL=
ARG IP_ADDRESS_API_URL=

COPY pubspec.yaml ./
RUN flutter pub get

COPY . .

# Outside demo mode the real Supabase credentials are mandatory.
RUN if [ "$DEMO_MODE" != "true" ]; then \
      test -n "$SUPABASE_URL" && test -n "$SUPABASE_ANON_KEY"; \
    fi && \
    flutter build web --release --pwa-strategy=none \
      --dart-define=DEMO_MODE="$DEMO_MODE" \
      --dart-define=SUPABASE_URL="$SUPABASE_URL" \
      --dart-define=SUPABASE_ANON_KEY="$SUPABASE_ANON_KEY" \
      --dart-define=FLUTTERFLOW_ASSETS_BASE_URL="$FLUTTERFLOW_ASSETS_BASE_URL" \
      --dart-define=TELEGRAM_SUPPORT_URL="$TELEGRAM_SUPPORT_URL" \
      --dart-define=WHATSAPP_BASE_URL="$WHATSAPP_BASE_URL" \
      --dart-define=IP_ADDRESS_API_URL="$IP_ADDRESS_API_URL"

FROM nginx:1.27-alpine

COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1
