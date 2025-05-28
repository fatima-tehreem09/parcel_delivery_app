import 'dart:async';

import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../const/colors.dart';

class CountdownTimer extends ConsumerStatefulWidget {
  const CountdownTimer({
    super.key,
    this.seconds = 10,
    required this.onComplete,
    required this.onTimerEnd,
  });

  final int seconds;
  final VoidCallback onComplete;
  final VoidCallback onTimerEnd;

  @override
  ConsumerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends ConsumerState<CountdownTimer> {
  late Duration _duration;
  Timer? _timer;

  void _startTimer() {
    _duration = Duration(seconds: widget.seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds == 0) {
        timer.cancel();
        widget.onComplete();
        widget.onTimerEnd();
      } else {
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
        });
      }
    });
  }

  void restartTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InterTightText(
      '${_duration.inSeconds} sec',
      size: 12,
      fontWeight: FontWeight.w700,
      color: AppColors.greyPrimary,
    );
  }
}
