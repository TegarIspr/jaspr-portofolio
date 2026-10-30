import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'package:universal_web/web.dart' as web;

import '../data/profile.dart';

/// Navigasi atas. Dihidrasi di klien supaya tombol menu mobile bisa dibuka-tutup.
@client
class NavBar extends StatefulComponent {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  static const _links = [
    ('Tentang', '#about'),
    ('Proyek', '#projects'),
    ('Pengalaman', '#experience'),
    ('Kontak', '#contact'),
  ];

  bool open = false;

  void _close() => setState(() => open = false);

  /// Tema disimpan di localStorage; skrip kecil di `<head>` menerapkannya sebelum halaman tampil.
  void _toggleTheme() {
    final root = web.document.documentElement!;
    final next = root.getAttribute('data-theme') == 'light' ? 'dark' : 'light';
    root.setAttribute('data-theme', next);
    try {
      web.window.localStorage.setItem('theme', next);
    } catch (_) {}
  }

  @override
  Component build(BuildContext context) {
    return header(classes: 'nav${open ? ' nav--open' : ''}', [
      div(classes: 'nav__inner container', [
        a(href: '#top', classes: 'nav__logo', onClick: _close, [
          span(classes: 'nav__logo-mark', [.text(Profile.initials)]),
          span([.text(Profile.name)]),
        ]),
        nav(classes: 'nav__links', [
          for (final (label, href) in _links) a(href: href, onClick: _close, [.text(label)]),
          a(href: '#contact', classes: 'btn btn--small btn--primary', onClick: _close, [.text('Hubungi Saya')]),
        ]),
        button(
          classes: 'theme-toggle',
          attributes: {'aria-label': 'Ganti mode terang/gelap', 'title': 'Ganti tema'},
          onClick: _toggleTheme,
          [
            span(classes: 'icon theme-toggle__sun', [RawText(Icons.sun)]),
            span(classes: 'icon theme-toggle__moon', [RawText(Icons.moon)]),
          ],
        ),
        button(
          classes: 'nav__toggle',
          attributes: {'aria-label': 'Buka menu', 'aria-expanded': '$open'},
          onClick: () => setState(() => open = !open),
          [span([]), span([]), span([])],
        ),
      ]),
    ]);
  }
}
