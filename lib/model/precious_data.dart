import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'precious_data.freezed.dart';

/// 名前は適当
@freezed
abstract class PreciousData with _$PreciousData {
  const factory PreciousData({
    String id,
    String value1,
    String value2,
  }) = _PreciousData;
}
