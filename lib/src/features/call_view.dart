import 'dart:async';

import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/call_accept.dart';
import 'package:abiola_along_client_app/src/widgets/call_decline.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CallView extends ConsumerStatefulWidget {
  const CallView.builder(BuildContext context, GoRouterState state,
      {super.key});

  static const path = "/call";
  static const name = "call";

  @override
  ConsumerState createState() => _CallViewState();
}

class _CallViewState extends ConsumerState<CallView> {
  bool isCallAccepted = false;
  bool isCallDeclined = false;
  Timer? _timer;
  int _seconds = 0;
  int _minutes = 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        if (_seconds == 60) {
          _seconds = 0;
          _minutes++;
        }
      });
    });
  }

  String _formatTime(int minutes, int seconds) {
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffD1D5DB),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
            ),
            30.heightBox,
            OnestText(
              "Coffee Packet Tag Owner",
              size: 24,
              fontWeight: FontWeight.w700,
            ),
            if (isCallAccepted)
              OnestText(
                _formatTime(_minutes, _seconds),
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.hintDarkGrey,
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                50,
                MediaQuery.sizeOf(context).height / 2.5,
                50,
                MediaQuery.of(context).padding.bottom + 20,
              ),
              child: isCallAccepted
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isCallDeclined = true;
                          _timer?.cancel();
                          context.pop();
                        });
                      },
                      child: const CallDecline(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isCallDeclined = true;
                              context.pop();
                            });
                          },
                          child: const CallDecline(),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isCallAccepted = true;
                              _startTimer();
                            });
                          },
                          child: const CallAccept(),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
