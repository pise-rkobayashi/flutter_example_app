import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/feature/detail/ID002_DetailScreen.dart';
import 'package:flutter_sample_app/feature/top/ID001_TopScreen.dart';
import 'package:flutter_sample_app/feature/top/item/top_item.dart';

class Router {
  static const Root = '/';

  // 外部からインスタンス生成をさせない
  Router._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Root:
      case ID001_TopScreen.NAME:
        return ID001_TopScreen.page();
      case ID002_DetailScreen.NAME:
        return ID002_DetailScreen.page(item: settings.arguments as TopItem);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text('page [${settings.name}] not found'),
            ),
          ),
        );
    }
  }
}
