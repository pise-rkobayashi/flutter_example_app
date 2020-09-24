import 'package:flutter_sample_app/feature/top/item/top_item_mapper.dart';
import 'package:flutter_sample_app/repository/precious_data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import 'item/top_item.dart';

part 'top_state.freezed.dart';

enum TopScreenState {
  Init,
  Loading,
  Valid,
  Error,
}

@freezed
abstract class TopState with _$TopState {
  const factory TopState({
    @Default(TopScreenState.Init) TopScreenState state,
    @Default([]) List<TopItem> items,
  }) = _TopState;
}

class TopStateController extends StateNotifier<TopState> with LocatorMixin {
  TopStateController() : super(const TopState());

  PreciousDataRepository get _repo => read<PreciousDataRepository>();

  @override
  void initState() {
    fetchData();
  }

  void addItem() {
    final newId = state.items.length + 1;
    final newItems = List.of(state.items);
    newItems.add(TopItem(
      id: newId.toString(),
      value1: 'v1: $newId',
      value2: 'v2: $newId',
    ));
    state = state.copyWith(items: newItems);
  }

  Future fetchData() async {
    // ロード中
    state = state.copyWith(state: TopScreenState.Loading);
    final result = await _repo.getPreciousDataList();
    if (result.isSuccess) {
      state = state.copyWith(
        state: TopScreenState.Valid,
        items: TopItemMapper.mapList(result.data),
      );
    } else {
      // TODO 実際はExceptionの種類によって分岐考える
      state = state.copyWith(
        state: TopScreenState.Error,
      );
    }
  }
}
