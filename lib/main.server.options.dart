// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:portfolio/components/navbar.dart' as _navbar;
import 'package:portfolio/components/typing_text.dart' as _typing_text;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _navbar.NavBar: ClientTarget<_navbar.NavBar>('navbar'),
    _typing_text.TypingText: ClientTarget<_typing_text.TypingText>(
      'typing_text',
    ),
  },
);
