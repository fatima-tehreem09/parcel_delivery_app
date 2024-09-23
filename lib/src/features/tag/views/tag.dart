import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Tag extends ConsumerStatefulWidget {
  const Tag.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/tag";
  static const name = "tag";

  @override
  ConsumerState createState() => _TagState();
}

class _TagState extends ConsumerState<Tag> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
