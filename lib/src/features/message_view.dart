import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/text_widget.dart';

class MessageView extends ConsumerStatefulWidget {
  const MessageView.builder(BuildContext context, GoRouterState state,
      {super.key});

  static const path = "/message";
  static const name = "message";

  @override
  ConsumerState createState() => _MessageViewState();
}

class _MessageViewState extends ConsumerState<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      appBar: const AppBarWidget(title: "Message"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffD1D5DB),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
            ),
            10.heightBox,
            OnestText(
              "Coffee Packet Tag Owner",
              size: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.hintDarkGrey,
            ),
            const Divider(
              height: 50,
              color: Color(0xffE5E7EB),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColors.primaryBlue.withOpacity(0.2),
                ),
                child: OnestText(
                  "Hi, How are you?",
                  color: AppColors.hintDarkGrey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColors.primaryWhite,
                ),
                child: OnestText(
                  "Hi, How are you?",
                  color: AppColors.hintDarkGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
