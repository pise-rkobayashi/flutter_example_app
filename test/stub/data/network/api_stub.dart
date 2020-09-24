import 'package:flutter_sample_app/data/network/api.dart';
import 'package:flutter_sample_app/data/network/response/get_precious_data_list.dart';

class ApiStub implements Api {
  @override
  Future<PreciousData> getPreciousData(String id) async {
    return PreciousData(
      id: id,
      value1: '値1',
      value2: '値2',
    );
  }

  @override
  Future<GetPreciousDataListResponse> getPreciousDataList() async {
    return GetPreciousDataListResponse(
      list: List.generate(
          5,
          (index) => PreciousData(
                id: '$index',
                value1: '値1 : $index',
                value2: '値2 : $index',
              )),
    );
  }
}

class ApiStubBuilder {
  static Api build() => ApiStub();
}
