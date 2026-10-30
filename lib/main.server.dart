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
      // Untuk GitHub Pages proyek (username.github.io/jaspr-portofolio) build dengan
      // --dart-define=BASE_PATH=/jaspr-portofolio/
      base: const String.fromEnvironment('BASE_PATH', defaultValue: '/'),
      meta: {
        'description': '${Profile.name} — ${Profile.roles.first}. ${Profile.tagline}',
        'theme-color': '#141218',
        'color-scheme': 'dark light',
      },
      head: [
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Roboto+Flex:opsz,wght@8..144,400;8..144,500;8..144,600;8..144,700&family=Roboto+Mono:wght@400;500&display=swap',
        ),
        link(rel: 'stylesheet', href: 'styles.css'),
        // Terapkan tema tersimpan sebelum halaman digambar, supaya tidak berkedip.
        script(
          content:
              "try{document.documentElement.setAttribute('data-theme',"
              "localStorage.getItem('theme')||'dark')}catch(e){}",
        ),
        script(src: 'reveal.js', defer: true),
      ],
      body: App(),
    ),
  );
}
