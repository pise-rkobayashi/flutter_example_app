import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app/build_config.dart';
import 'package:flutter_sample_app/feature/top/ID001_TopScreen.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'debug_state.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen._();

  static Widget create({Key key}) => MultiProvider(
        providers: [
          StateNotifierProvider<DebugStateController, DebugState>(
            create: (context) => DebugStateController(),
          ),
        ],
        child: const DebugScreen._(),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('アプリ表示名 : ${BuildConfig.APP_NAME}'),
                const Text('Flavor : ${BuildConfig.FLAVOR}'),
                _Button(
                  title: 'トップ',
                  onPressed: () =>
                      Navigator.pushNamed(context, ID001_TopScreen.NAME),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const _Button({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(title),
      onPressed: onPressed,
    );
  }
}
