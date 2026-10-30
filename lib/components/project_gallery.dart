import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../data/profile.dart';

/// Daftar proyek dengan filter kategori dan jendela detail.
@client
class ProjectGallery extends StatefulComponent {
  const ProjectGallery({super.key});

  @override
  State<ProjectGallery> createState() => ProjectGalleryState();
}

class ProjectGalleryState extends State<ProjectGallery> {
  static const _all = 'Semua';
  static final _categories = [
    _all,
    ...{for (final p in Profile.projects) p.category},
  ];

  String _filter = _all;
  Project? _open;
  StreamSubscription<web.KeyboardEvent>? _keys;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _keys = web.EventStreamProviders.keyDownEvent.forTarget(web.document).listen((e) {
        if (e.key == 'Escape' && _open != null) _close();
      });
    }
  }

  @override
  void dispose() {
    _keys?.cancel();
    super.dispose();
  }

  void _show(Project project) {
    setState(() => _open = project);
    web.document.documentElement?.classList.add('modal-open');
  }

  void _close() {
    setState(() => _open = null);
    web.document.documentElement?.classList.remove('modal-open');
  }

  Component _icon(String svg, {String classes = 'icon'}) => span(classes: classes, [RawText(svg)]);

  @override
  Component build(BuildContext context) {
    final visible = [
      for (final p in Profile.projects)
        if (_filter == _all || p.category == _filter) p,
    ];

    return div(classes: 'gallery', [
      div(
        classes: 'filters',
        attributes: {'role': 'tablist', 'aria-label': 'Filter proyek'},
        [
          for (final c in _categories)
            button(
              classes: 'filter${c == _filter ? ' filter--active' : ''}',
              attributes: {'role': 'tab', 'aria-selected': '${c == _filter}'},
              onClick: () => setState(() => _filter = c),
              [
                if (c == _filter) _icon(Icons.check),
                .text(c),
                span(classes: 'filter__count', [
                  .text(
                    '${c == _all ? Profile.projects.length : Profile.projects.where((project) => project.category == c).length}',
                  ),
                ]),
              ],
            ),
        ],
      ),
      div(classes: 'projects', [
        for (final project in visible)
          article(
            key: ValueKey(project.title),
            classes: 'card card--${project.accent}',
            [
              div(classes: 'card__top', [
                _icon(Icons.byName(project.icon), classes: 'card__icon'),
                span(classes: 'card__meta', [.text('${project.category} · ${project.year}')]),
              ]),
              h3([.text(project.title)]),
              p([.text(project.description)]),
              ul(classes: 'card__tags', [
                for (final tag in project.tags) li([.text(tag)]),
              ]),
              button(classes: 'card__more', onClick: () => _show(project), [
                .text('Lihat detail'),
                _icon(Icons.arrowRight),
              ]),
            ],
          ),
      ]),
      if (_open case final project?) _modal(project),
    ]);
  }

  Component _modal(Project project) {
    return div(classes: 'modal', [
      div(classes: 'modal__backdrop', events: {'click': (_) => _close()}, []),
      div(
        classes: 'modal__panel card--${project.accent}',
        attributes: {'role': 'dialog', 'aria-modal': 'true', 'aria-label': project.title},
        [
          button(classes: 'modal__close', attributes: {'aria-label': 'Tutup'}, onClick: _close, [_icon(Icons.close)]),
          div(classes: 'modal__head', [
            _icon(Icons.byName(project.icon), classes: 'card__icon'),
            div([
              span(classes: 'card__meta', [.text('${project.category} · ${project.year}')]),
              h3([.text(project.title)]),
            ]),
          ]),
          p(classes: 'modal__text', [.text(project.details)]),
          h4([.text('Sorotan')]),
          ul(classes: 'modal__list', [
            for (final h in project.highlights) li([_icon(Icons.check), .text(h)]),
          ]),
          ul(classes: 'card__tags', [
            for (final tag in project.tags) li([.text(tag)]),
          ]),
          div(classes: 'modal__actions', [
            if (project.liveUrl case final url?)
              a(href: url, target: Target.blank, classes: 'btn btn--primary btn--small', [
                .text('Lihat demo'),
                _icon(Icons.external),
              ]),
            if (project.repoUrl case final url?)
              a(href: url, target: Target.blank, classes: 'btn btn--ghost btn--small', [
                _icon(Icons.github),
                .text('Kode sumber'),
              ]),
          ]),
        ],
      ),
    ]);
  }
}
