import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/navigation/app_router.dart';

import '../feature/debug/debug_screen.dart';

class StubRouter {
  StubRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.Root:
        return MaterialPageRoute(
          builder: (_) => DebugScreen.create(),
        );
      default:
        return AppRouter.generateRoute(settings);
    }
  }
}
