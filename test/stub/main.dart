import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/app/build_config.dart';
import 'package:flutter_sample_app/app/sample_app.dart';

import 'component/stub_component.dart';
import 'navigation/stub_router.dart';

void main() {
  runApp(SampleApp(
    buildConfig: BuildConfig(
      isDebug: true,
    ),
    component: StubComponent(),
    routeFactory: StubRouter.generateRoute,
  ));
}
