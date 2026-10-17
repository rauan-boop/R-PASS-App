FROM ghcr.io/cirruslabs/flutter:3.24.5 AS build

WORKDIR /app

ARG SUPABASE_URL
ARG SUPABASE_ANON_KEY
ARG FIREBASE_API_KEY
ARG FIREBASE_AUTH_DOMAIN
ARG FIREBASE_PROJECT_ID
ARG FIREBASE_STORAGE_BUCKET
ARG FIREBASE_MESSAGING_SENDER_ID
ARG FIREBASE_APP_ID
ARG FLUTTERFLOW_ASSETS_BASE_URL
ARG TELEGRAM_SUPPORT_URL
ARG WHATSAPP_BASE_URL
ARG IP_ADDRESS_API_URL

COPY pubspec.yaml ./
RUN flutter pub get

COPY . .

RUN test -n "$SUPABASE_URL" && \
    test -n "$SUPABASE_ANON_KEY" && \
    test -n "$FIREBASE_API_KEY" && \
    test -n "$FIREBASE_AUTH_DOMAIN" && \
    test -n "$FIREBASE_PROJECT_ID" && \
    test -n "$FIREBASE_STORAGE_BUCKET" && \
    test -n "$FIREBASE_MESSAGING_SENDER_ID" && \
    test -n "$FIREBASE_APP_ID" && \
    test -n "$FLUTTERFLOW_ASSETS_BASE_URL" && \
    test -n "$TELEGRAM_SUPPORT_URL" && \
    test -n "$WHATSAPP_BASE_URL" && \
    test -n "$IP_ADDRESS_API_URL" && \
    flutter build web --release --pwa-strategy=none \
      --dart-define=SUPABASE_URL="$SUPABASE_URL" \
      --dart-define=SUPABASE_ANON_KEY="$SUPABASE_ANON_KEY" \
      --dart-define=FIREBASE_API_KEY="$FIREBASE_API_KEY" \
      --dart-define=FIREBASE_AUTH_DOMAIN="$FIREBASE_AUTH_DOMAIN" \
      --dart-define=FIREBASE_PROJECT_ID="$FIREBASE_PROJECT_ID" \
      --dart-define=FIREBASE_STORAGE_BUCKET="$FIREBASE_STORAGE_BUCKET" \
      --dart-define=FIREBASE_MESSAGING_SENDER_ID="$FIREBASE_MESSAGING_SENDER_ID" \
      --dart-define=FIREBASE_APP_ID="$FIREBASE_APP_ID" \
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
