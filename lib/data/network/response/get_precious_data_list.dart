import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_precious_data_list.freezed.dart';
part 'get_precious_data_list.g.dart';

@freezed
abstract class GetPreciousDataListResponse with _$GetPreciousDataListResponse {
  const factory GetPreciousDataListResponse({
    @JsonKey(name: 'data') List<PreciousData> list,
  }) = _GetPreciousDataListResponse;

  factory GetPreciousDataListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPreciousDataListResponseFromJson(json);
}

@freezed
abstract class PreciousData with _$PreciousData {
  const factory PreciousData({
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'v1') String value1,
    @JsonKey(name: 'v2') String value2,
  }) = _PreciousData;

  factory PreciousData.fromJson(Map<String, dynamic> json) =>
      _$PreciousDataFromJson(json);
}
