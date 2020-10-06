import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app/build_config.dart';
import 'package:flutter_sample_app/app/sample_app.dart';
import 'package:flutter_sample_app/di/app_component.dart';
import 'package:flutter_sample_app/navigation/app_router.dart';

void main() {
  runApp(SampleApp(
    buildConfig: BuildConfig(
      isDebug: true,
    ),
    component: AppComponent(),
    routeFactory: AppRouter.generateRoute,
  ));
}
