import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/typing_text.dart';
import '../data/profile.dart';

/// Judul seksi dengan label kecil bernomor, misal "01 · Tentang".
Component sectionHeading(String number, String label, String title) {
  return div(classes: 'section__heading reveal', [
    span(classes: 'section__eyebrow', [.text('$number · $label')]),
    h2([.text(title)]),
  ]);
}

Component icon(String svg, {String classes = 'icon'}) => span(classes: classes, [RawText(svg)]);

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero', [
      div(classes: 'hero__glow hero__glow--1', []),
      div(classes: 'hero__glow hero__glow--2', []),
      div(classes: 'hero__grid', []),
      div(classes: 'container hero__inner', [
        div(classes: 'hero__text', [
          span(classes: 'badge', [
            span(classes: 'badge__dot', []),
            .text('Terbuka untuk proyek baru'),
          ]),
          h1([
            span(classes: 'hero__greet', [.text(Profile.greeting)]),
            .text(Profile.name),
          ]),
          p(classes: 'hero__role', [const TypingText()]),
          p(classes: 'hero__tagline', [.text(Profile.tagline)]),
          div(classes: 'hero__actions', [
            a(href: '#projects', classes: 'btn btn--primary', [
              .text('Lihat Proyek'),
              icon(Icons.arrowRight),
            ]),
            a(href: '#contact', classes: 'btn btn--ghost', [.text('Hubungi Saya')]),
          ]),
          div(classes: 'hero__socials', [
            a(href: Profile.github, target: Target.blank, attributes: {'aria-label': 'GitHub'}, [icon(Icons.github)]),
            a(
              href: Profile.linkedin,
              target: Target.blank,
              attributes: {'aria-label': 'LinkedIn'},
              [
                icon(Icons.linkedin),
              ],
            ),
            a(href: 'mailto:${Profile.email}', attributes: {'aria-label': 'Email'}, [icon(Icons.mail)]),
          ]),
        ]),
        div(classes: 'hero__visual', [
          div(classes: 'avatar', [
            div(classes: 'avatar__ring', []),
            div(classes: 'avatar__core', [.text(Profile.initials)]),
          ]),
          div(classes: 'code-card', [
            div(classes: 'code-card__bar', [span([]), span([]), span([])]),
            pre([
              code([
                RawText(
                  '<span class="k">final</span> dev = <span class="t">Developer</span>(\n'
                  '  name: <span class="s">\'${Profile.name}\'</span>,\n'
                  '  stack: [<span class="s">\'Dart\'</span>, <span class="s">\'Jaspr\'</span>],\n'
                  '  coffee: <span class="n">true</span>,\n'
                  ');',
                ),
              ]),
            ]),
          ]),
        ]),
      ]),
      a(href: '#about', classes: 'hero__scroll', attributes: {'aria-label': 'Gulir ke bawah'}, [span([])]),
    ]);
  }
}

class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'section', [
      div(classes: 'container', [
        sectionHeading('01', 'Tentang', 'Sedikit tentang saya'),
        div(classes: 'about', [
          div(classes: 'about__text reveal', [
            for (final paragraph in Profile.about) p([.text(paragraph)]),
            p(classes: 'about__location', [icon(Icons.mapPin), .text(Profile.location)]),
          ]),
          div(classes: 'about__stats reveal', [
            for (final stat in Profile.stats)
              div(classes: 'stat', [
                span(classes: 'stat__value gradient-text', [.text(stat.value)]),
                span(classes: 'stat__label', [.text(stat.label)]),
              ]),
          ]),
        ]),
        div(classes: 'skills reveal', [
          h3([.text('Teknologi yang saya gunakan')]),
          ul(classes: 'skills__list', [
            for (final skill in Profile.skills) li(classes: 'chip', [.text(skill)]),
          ]),
        ]),
      ]),
    ]);
  }
}

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'section', [
      div(classes: 'container', [
        sectionHeading('02', 'Proyek', 'Karya pilihan'),
        div(classes: 'projects', [
          for (final project in Profile.projects)
            article(classes: 'card card--${project.accent} reveal', [
              div(classes: 'card__top', [
                icon(Icons.byName(project.icon), classes: 'card__icon'),
                div(classes: 'card__links', [
                  if (project.repoUrl case final url?)
                    a(
                      href: url,
                      target: Target.blank,
                      attributes: {'aria-label': 'Kode sumber'},
                      [
                        icon(Icons.github),
                      ],
                    ),
                  if (project.liveUrl case final url?)
                    a(
                      href: url,
                      target: Target.blank,
                      attributes: {'aria-label': 'Lihat demo'},
                      [
                        icon(Icons.external),
                      ],
                    ),
                ]),
              ]),
              h3([.text(project.title)]),
              p([.text(project.description)]),
              ul(classes: 'card__tags', [
                for (final tag in project.tags) li([.text(tag)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }
}

class ExperienceSection extends StatelessComponent {
  const ExperienceSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'experience', classes: 'section', [
      div(classes: 'container', [
        sectionHeading('03', 'Pengalaman', 'Perjalanan karier'),
        ol(classes: 'timeline', [
          for (final exp in Profile.experiences)
            li(classes: 'timeline__item reveal', [
              span(classes: 'timeline__dot', []),
              span(classes: 'timeline__period', [.text(exp.period)]),
              h3([.text(exp.role)]),
              span(classes: 'timeline__company', [.text(exp.company)]),
              p([.text(exp.description)]),
            ]),
        ]),
      ]),
    ]);
  }
}

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'contact', classes: 'section', [
      div(classes: 'container', [
        div(classes: 'contact reveal', [
          span(classes: 'section__eyebrow', [.text('04 · Kontak')]),
          h2([
            .text('Punya ide? '),
            span(classes: 'gradient-text', [.text('Mari wujudkan bersama.')]),
          ]),
          p([
            .text(
              'Saya terbuka untuk kerja sama, proyek freelance, atau sekadar ngobrol soal teknologi. '
              'Kirim pesan dan saya akan membalas secepatnya.',
            ),
          ]),
          a(href: 'mailto:${Profile.email}', classes: 'btn btn--primary btn--large', [
            icon(Icons.mail),
            .text(Profile.email),
          ]),
          div(classes: 'contact__socials', [
            a(href: Profile.github, target: Target.blank, [icon(Icons.github), .text('GitHub')]),
            a(href: Profile.linkedin, target: Target.blank, [icon(Icons.linkedin), .text('LinkedIn')]),
          ]),
        ]),
      ]),
    ]);
  }
}

class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer', [
      div(classes: 'container footer__inner', [
        span([.text('© ${DateTime.now().year} ${Profile.name}. Dibuat dengan ♥ menggunakan Dart & Jaspr.')]),
        a(href: '#top', [.text('Kembali ke atas ↑')]),
      ]),
    ]);
  }
}
