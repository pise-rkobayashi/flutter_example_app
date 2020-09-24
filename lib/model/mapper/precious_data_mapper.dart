import 'package:flutter_sample_app/data/network/response/get_precious_data_list.dart'
    as pd;
import 'package:flutter_sample_app/model/precious_data.dart';

class PreciousDataMapper {
  PreciousDataMapper._();

  static List<PreciousData> mapList(List<pd.PreciousData> list) {
    return list.map(map).toList();
  }

  static PreciousData map(pd.PreciousData e) => PreciousData(
        id: e.id,
        value1: e.value1,
        value2: e.value2,
      );
}
