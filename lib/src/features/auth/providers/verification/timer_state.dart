import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    required Duration interval,
    required bool isTimerCompleted,
    required int currentSeconds,
    required int timerMaxSeconds,
  }) = _TimerState;

  factory TimerState.initial() => const TimerState(
        currentSeconds: 0,
        interval: Duration(seconds: 1),
        isTimerCompleted: false,
        timerMaxSeconds: 120,
      );
}
