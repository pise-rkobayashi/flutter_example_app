import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_item.freezed.dart';

@freezed
abstract class TopItem with _$TopItem {
  const factory TopItem({
    String id,
    String value1,
    String value2,
  }) = _TopItem;
}
