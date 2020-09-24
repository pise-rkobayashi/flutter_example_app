import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app/build_config.dart';
import 'package:flutter_sample_app/di/component.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final _globalNavigatorKey = GlobalKey<NavigatorState>();

class SampleApp extends StatelessWidget {
  final BuildConfig buildConfig;
  final Component component;
  final RouteFactory routeFactory;

  /// アプリの前面に表示
  final List<WidgetBuilder> frontLayer;

  const SampleApp({
    Key key,
    @required this.buildConfig,
    @required this.component,
    @required this.routeFactory,
    this.frontLayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      key: _globalNavigatorKey,
      providers: <SingleChildWidget>[
        Provider.value(value: buildConfig),
        ...component.build(context),
      ],
      child: MaterialApp(
        title: BuildConfig.APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: routeFactory,
        builder: (context, child) {
          return frontLayer?.isNotEmpty == true
              ? Scaffold(
                  body: Stack(
                    children: <Widget>[
                      child,
                      ...frontLayer
                          .map((e) => e(context))
                          .toList(growable: false),
                    ],
                  ),
                )
              : child;
        },
      ),
    );
  }
}
