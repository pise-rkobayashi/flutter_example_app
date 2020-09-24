import 'package:flutter_sample_app/data/network/api.dart';
import 'package:flutter_sample_app/model/mapper/precious_data_mapper.dart';
import 'package:flutter_sample_app/model/precious_data.dart';
import 'package:flutter_sample_app/util/result.dart';

class PreciousDataRepository {
  final Api _api;

  PreciousDataRepository(this._api);

  Future<Result<List<PreciousData>>> getPreciousDataList() async {
    // TODO DBとやりとり必要ならDBの処理追加
    // TODO 実際は丁寧にエラーを扱う
    try {
      final res = await _api.getPreciousDataList();
      return Result.success(PreciousDataMapper.mapList(res.list));
    } catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<PreciousData>> getPreciousData(String id) async {
    // TODO DBとやりとり必要ならDBの処理追加
    try {
      final res = await _api.getPreciousData(id);
      return Result.success(PreciousDataMapper.map(res));
    } catch (e) {
      return Result.error(e);
    }
  }
}
