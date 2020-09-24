import 'package:flutter/material.dart';
import 'package:flutter_sample_app/feature/top/item/top_item.dart';
import 'package:flutter_sample_app/navigation/app_page_route.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'detail_state.dart';

class ID002_DetailScreen extends StatelessWidget {
  static const NAME = '/detail';

  const ID002_DetailScreen._();

  static PageRoute page({
    @required TopItem item,
  }) =>
      AppPageRoute.create(builder: (_) => create(item: item));

  static Widget create({@required TopItem item}) => MultiProvider(
        providers: [
          StateNotifierProvider<DetailStateController, DetailState>(
            create: (context) => DetailStateController(item: item),
          ),
        ],
        child: const ID002_DetailScreen._(),
      );

  @override
  Widget build(BuildContext context) {
    final item = context.select((DetailState s) => s.item);
    return Scaffold(
      appBar: AppBar(
        title: Text('アイテムID: ${item.id}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Item(title: '値1', value: item.value1),
            _Item(title: '値2', value: item.value2),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String value;

  const _Item({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(flex: 1, child: Text(title)),
            Expanded(flex: 2, child: Text(value)),
          ],
        ),
      ),
    );
  }
}
