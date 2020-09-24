import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sample_app/data/network/api_builder.dart';
import 'package:flutter_sample_app/data/preferences/app_preferences.dart';
import 'package:flutter_sample_app/di/component.dart';
import 'package:flutter_sample_app/repository/repository_components.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class AppComponent implements Component {
  @override
  List<SingleChildWidget> build(BuildContext context) {
    return [
      Provider(create: (_) => AppPreferences()),
      Provider(create: ApiBuilder.build),
      ...repositoryComponents,
    ];
  }
}
