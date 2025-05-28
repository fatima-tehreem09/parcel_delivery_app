import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownTimer extends ConsumerStatefulWidget {
  const CountdownTimer({
    super.key,
    this.seconds = 60,
    required this.onComplete,
  });
  final int seconds;
  final VoidCallback onComplete;

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
      } else {
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
        });
      }
    });
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
    return Text(
      '${_duration.inSeconds} sec',
      style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            // color: AppColors.customBlack,
          ),
    );
  }
}
