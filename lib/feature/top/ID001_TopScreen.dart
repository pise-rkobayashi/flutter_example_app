import 'package:flutter/material.dart';
import 'package:flutter_sample_app/feature/detail/ID002_DetailScreen.dart';
import 'package:flutter_sample_app/feature/top/item/top_item.dart';
import 'package:flutter_sample_app/navigation/app_page_route.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'top_state.dart';

class ID001_TopScreen extends StatelessWidget {
  static const NAME = '/top';

  const ID001_TopScreen._();

  static PageRoute page() => AppPageRoute.create(builder: (_) => create());

  static Widget create({Key key}) => MultiProvider(
        providers: [
          StateNotifierProvider<TopStateController, TopState>(
            create: (context) => TopStateController(),
          ),
        ],
        child: const ID001_TopScreen._(),
      );

  @override
  Widget build(BuildContext context) {
    final state = context.select((TopState s) => s.state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('トップ'),
      ),
      body: () {
        switch (state) {
          case TopScreenState.Init:
          case TopScreenState.Loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case TopScreenState.Valid:
            return const _ItemList();
          case TopScreenState.Error:
            return const _Error();
        }
      }(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<TopStateController>().addItem(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList();

  @override
  Widget build(BuildContext context) {
    final items = context.select((TopState s) => s.items);
    return ListView.separated(
      itemBuilder: (context, index) => _Item(
        item: items[index],
        onTap: (item) {
          // 遷移方法
          // Page名を指定する方法(Routerに遷移ページの定義が必要)
          Navigator.pushNamed(context, ID002_DetailScreen.NAME,
              arguments: item);
          // PageRouteを直接指定する方法
          // Navigator.push(context, ID002_DetailScreen.page(item: item));
        },
      ),
      separatorBuilder: (context, index) => const Divider(height: 1.0),
      itemCount: items.length,
    );
  }
}

class _Item extends StatelessWidget {
  final TopItem item;
  final void Function(TopItem) onTap;

  const _Item({
    Key key,
    @required this.item,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(item),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.id),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(item.value1),
                ),
                Expanded(
                  flex: 1,
                  child: Text(item.value2),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('読み込みエラー'),
          RaisedButton(
            onPressed: () => context.read<TopStateController>().fetchData(),
            child: const Text('再読み込み'),
          )
        ],
      ),
    );
  }
}
