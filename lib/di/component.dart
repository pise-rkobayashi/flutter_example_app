import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';

abstract class Component {
  List<SingleChildWidget> build(BuildContext context);
}
