/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'data/profile.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: '${Profile.name} · Portofolio',
      lang: 'id',
      // Untuk GitHub Pages proyek (username.github.io/portfolio) build dengan
      // --dart-define=BASE_PATH=/portfolio/
      base: const String.fromEnvironment('BASE_PATH', defaultValue: '/'),
      meta: {
        'description': '${Profile.name} — ${Profile.roles.first}. ${Profile.tagline}',
        'theme-color': '#0a0a12',
      },
      head: [
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&display=swap',
        ),
        link(rel: 'stylesheet', href: 'styles.css'),
        script(src: 'reveal.js', defer: true),
      ],
      body: App(),
    ),
  );
}
