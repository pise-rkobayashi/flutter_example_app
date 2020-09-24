import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'debug_state.freezed.dart';

@freezed
abstract class DebugState with _$DebugState {
  const factory DebugState({
    int dummy,
  }) = _DebugState;
}

class DebugStateController extends StateNotifier<DebugState> with LocatorMixin {
  DebugStateController() : super(const DebugState());
}
