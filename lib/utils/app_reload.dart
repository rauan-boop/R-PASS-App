// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Drops service workers and Cache Storage, then reloads with a cache-buster,
/// so the newest build is fetched (same effect as Ctrl+F5).
Future<void> reloadApp() async {
  try {
    final regs = await html.window.navigator.serviceWorker?.getRegistrations();
    for (final r in regs ?? const []) {
      await (r as html.ServiceWorkerRegistration).unregister();
    }
    final keys = await html.window.caches?.keys();
    for (final k in keys ?? const []) {
      await html.window.caches?.delete(k);
    }
  } catch (_) {}
  final base = html.window.location.origin;
  html.window.location
      .replace('$base/?v=${DateTime.now().millisecondsSinceEpoch}');
}
