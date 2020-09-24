import 'package:flutter/material.dart';

class AppPageRoute {
  static PageRoute create<T>({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    // プラットフォームごとにRouteを分けたい場合ここで分岐
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
