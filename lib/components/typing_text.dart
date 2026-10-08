import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';

/// Efek mengetik yang berganti-ganti di antara [Profile.roles].
@client
class TypingText extends StatefulComponent {
  const TypingText({super.key});

  @override
  State<TypingText> createState() => TypingTextState();
}

class TypingTextState extends State<TypingText> {
  static const _roles = Profile.roles;

  int _index = 0;
  int _length = _roles.first.length;
  // Teks awal sudah lengkap (hasil pre-render), jadi animasi dimulai dengan menghapus.
  bool _deleting = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Saat pre-render, teks lengkap ditampilkan; animasi hanya berjalan di browser.
    if (kIsWeb) _schedule(const Duration(milliseconds: 1800));
  }

  void _schedule(Duration delay) {
    _timer = Timer(delay, _tick);
  }

  void _tick() {
    var pause = 85;
    setState(() {
      if (_deleting) {
        _length--;
        pause = 40;
        if (_length == 0) {
          _deleting = false;
          _index = (_index + 1) % _roles.length;
          pause = 300;
        }
      } else {
        _length++;
        if (_length == _roles[_index].length) {
          _deleting = true;
          pause = 1800;
        }
      }
    });
    _schedule(Duration(milliseconds: pause));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    final word = _roles[_index];
    return span(classes: 'typing', [
      span(classes: 'gradient-text', [.text(word.substring(0, _length.clamp(0, word.length)))]),
      span(classes: 'typing__caret', attributes: {'aria-hidden': 'true'}, []),
    ]);
  }
}
