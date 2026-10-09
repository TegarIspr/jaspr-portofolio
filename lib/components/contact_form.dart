import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../data/profile.dart';

/// Form kontak sederhana. Karena situsnya statis, pesan dikirim lewat aplikasi
/// email pengunjung (mailto) setelah isian divalidasi.
@client
class ContactForm extends StatefulComponent {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  String _name = '';
  String _message = '';
  bool _submitted = false;
  bool _copied = false;
  Timer? _copyTimer;

  String? get _nameError => _name.trim().isEmpty ? 'Nama wajib diisi.' : null;
  String? get _messageError => _message.trim().length < 10 ? 'Pesan minimal 10 karakter.' : null;

  void _send() {
    setState(() => _submitted = true);
    if (_nameError != null || _messageError != null) return;
    final uri = Uri(
      scheme: 'mailto',
      path: Profile.email,
      query:
          'subject=${Uri.encodeComponent('Halo dari ${_name.trim()}')}'
          '&body=${Uri.encodeComponent(_message.trim())}',
    );
    web.window.location.href = uri.toString();
  }

  void _copy() {
    web.window.navigator.clipboard.writeText(Profile.email);
    _copyTimer?.cancel();
    setState(() => _copied = true);
    _copyTimer = Timer(const Duration(seconds: 2), () => setState(() => _copied = false));
  }

  @override
  void dispose() {
    _copyTimer?.cancel();
    super.dispose();
  }

  Component _icon(String svg) => span(classes: 'icon', [RawText(svg)]);

  Component _field(String title, String? error, Component control) {
    final showError = _submitted && error != null;
    return label(classes: 'field${showError ? ' field--error' : ''}', [
      span(classes: 'field__label', [.text(title)]),
      control,
      if (showError) span(classes: 'field__error', [.text(error)]),
    ]);
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'contact__box', [
      div(classes: 'contact__form', [
        _field(
          'Nama',
          _nameError,
          input<String>(
            type: InputType.text,
            value: _name,
            attributes: {'placeholder': 'Nama kamu', 'autocomplete': 'name'},
            onInput: (v) => setState(() => _name = v),
          ),
        ),
        _field(
          'Pesan',
          _messageError,
          textarea(
            rows: 4,
            placeholder: 'Ceritakan ide atau proyekmu…',
            onInput: (v) => setState(() => _message = v),
            [],
          ),
        ),
        button(classes: 'btn btn--primary btn--large', onClick: _send, [
          _icon(Icons.mail),
          .text('Kirim lewat email'),
        ]),
      ]),
      div(classes: 'contact__alt', [
        span([.text('atau kirim langsung ke')]),
        button(
          classes: 'copy${_copied ? ' copy--done' : ''}',
          attributes: {'aria-label': 'Salin alamat email'},
          onClick: _copy,
          [
            span([.text(Profile.email)]),
            _icon(_copied ? Icons.check : Icons.copy),
          ],
        ),
        span(
          classes: 'copy__toast${_copied ? ' copy__toast--show' : ''}',
          attributes: {'role': 'status'},
          [
            .text(_copied ? 'Email disalin!' : ''),
          ],
        ),
      ]),
    ]);
  }
}
