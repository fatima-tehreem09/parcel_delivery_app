import 'dart:async';

import 'package:abiola_along_client_app/src/features/auth/providers/verification/timer_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_provider.g.dart';

@riverpod
class TimerNotifier extends _$TimerNotifier {
  @override
  TimerState build() {
    return TimerState.initial();
  }

  Timer? timer;

  String get timerText =>
      '${((state.timerMaxSeconds - state.currentSeconds) ~/ 60).toString().padLeft(2, '0')}:${((state.timerMaxSeconds - state.currentSeconds) % 60).toString().padLeft(2, '0')}';

  void startTimeout([int? milliseconds]) {
    var duration = state.interval;
    timer = Timer.periodic(duration, (timer) {
      state = state.copyWith(currentSeconds: timer.tick);
      if (timer.tick >= state.timerMaxSeconds) {
        timer.cancel();
        state = state.copyWith(isTimerCompleted: true);
      }
    });
  }

  void resetTimer() {
    timer?.cancel();
    state = TimerState.initial();
  }

  void initState() {
    startTimeout();
  }

  void dispose() {
    startTimeout();
  }
}
