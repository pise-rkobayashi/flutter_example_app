import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/navigation/router.dart';

import '../feature/debug/debug_screen.dart';

class StubRouter {
  StubRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Router.Root:
        return MaterialPageRoute(
          builder: (_) => DebugScreen.create(),
        );
      default:
        return Router.generateRoute(settings);
    }
  }
}
