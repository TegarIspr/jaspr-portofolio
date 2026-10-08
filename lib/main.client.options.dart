// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:portfolio/components/navbar.dart' deferred as _navbar;
import 'package:portfolio/components/typing_text.dart' deferred as _typing_text;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'navbar': ClientLoader(
      (p) => _navbar.NavBar(),
      loader: _navbar.loadLibrary,
    ),
    'typing_text': ClientLoader(
      (p) => _typing_text.TypingText(),
      loader: _typing_text.loadLibrary,
    ),
  },
);
