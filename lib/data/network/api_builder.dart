import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/data/network/api.dart';
import 'package:flutter_sample_app/data/preferences/app_preferences.dart';
import 'package:flutter_sample_app/util/json_pretty_printer.dart';
import 'package:provider/provider.dart';

class ApiBuilder {
  ApiBuilder._();

  static Api build(BuildContext context) {
    final dio = Dio()
      // 接続先URL
      ..options.baseUrl = 'https://example.xyz'
      ..options.connectTimeout = 15000
      ..options.receiveTimeout = 15000
      ..interceptors.add(AppInterceptor(context))
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: JsonPrettyPrinter.logPrint,
      ));
    return Api(dio);
  }
}

class AppInterceptor extends Interceptor {
  final BuildContext context;

  AppInterceptor(this.context);

  @override
  Future onRequest(RequestOptions options) async {
    // アクセストークンなどリクエスト共通
    final accessToken =
        (await context.read<AppPreferences>().accessToken).load();
    options.headers
        .putIfAbsent(HttpHeaders.authorizationHeader, () => accessToken);
    return super.onRequest(options);
  }
}
