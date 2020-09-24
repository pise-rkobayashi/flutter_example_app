import 'package:flutter/widgets.dart';

extension NavigatorExtension on NavigatorState {
  BuildContext get descendantContext => overlay.context;
}
