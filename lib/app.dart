import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/navbar.dart';
import 'data/profile.dart';
import 'sections/sections.dart';

/// Halaman utama portofolio. Dirender statis; komponen interaktif ([NavBar],
/// efek mengetik, galeri proyek, dan form kontak) dihidrasi di klien.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return .fragment([
      div(classes: 'scroll-progress', attributes: {'aria-hidden': 'true'}, []),
      const NavBar(),
      main_([
        const HeroSection(),
        const AboutSection(),
        const ProjectsSection(),
        const ExperienceSection(),
        const ContactSection(),
      ]),
      const SiteFooter(),
      // Floating action button (Material 3) menuju bagian kontak.
      a(
        href: '#contact',
        classes: 'fab',
        attributes: {'aria-label': 'Hubungi saya'},
        [
          span(classes: 'icon', [RawText(Icons.mail)]),
          span(classes: 'fab__label', [.text('Hubungi')]),
        ],
      ),
    ]);
  }
}
