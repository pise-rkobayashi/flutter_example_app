import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/di/component.dart';
import 'package:flutter_sample_app/repository/repository_components.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/network/api_stub.dart';

class StubComponent implements Component {
  @override
  List<SingleChildWidget> build(BuildContext context) {
    return [
      Provider(create: (_) => ApiStubBuilder.build()),
      ...repositoryComponents,
    ];
  }
}
