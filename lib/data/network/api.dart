import 'package:dio/dio.dart';
import 'package:flutter_sample_app/data/network/response/get_precious_data_list.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('/precious')
  Future<GetPreciousDataListResponse> getPreciousDataList();

  @GET('/precious/{id}')
  Future<PreciousData> getPreciousData(@Path() String id);
}
