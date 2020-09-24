import 'package:flutter/foundation.dart';
import 'package:flutter_sample_app/feature/top/item/top_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    // TODO いろいろな画面から呼びたいなら、DetailItemなどを作る
    @required TopItem item,
  }) = _DetailState;
}

class DetailStateController extends StateNotifier<DetailState>
    with LocatorMixin {
  DetailStateController({@required TopItem item})
      : super(DetailState(item: item));
}
