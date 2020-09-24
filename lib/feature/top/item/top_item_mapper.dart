import 'package:flutter_sample_app/feature/top/item/top_item.dart';
import 'package:flutter_sample_app/model/precious_data.dart';

class TopItemMapper {
  TopItemMapper._();

  static List<TopItem> mapList(List<PreciousData> list) {
    return list.map(map).toList();
  }

  static TopItem map(PreciousData e) => TopItem(
        id: e.id,
        value1: e.value1,
        value2: e.value2,
      );
}
