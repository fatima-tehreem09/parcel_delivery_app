import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/my_tag_widget.dart';
import 'package:abiola_along_client_app/src/features/tag/views/progress_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../const/colors.dart';
import '../../../widgets/app_bar.dart';
import '../widgets/tab_bar.dart';

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

class _TagState extends ConsumerState<Tag> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Tag Details",
        isHome: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            TabBarWidget(
              controller: _controller,
              tabs: const [
                Tab(text: "In Progress"),
                Tab(text: "Delivered"),
              ],
            ),
            // 20.heightBox,
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 20),
                    separatorBuilder: (_, index) => 10.heightBox,
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (index, _) {
                      return MyTagWidget(
                        onTap: () {
                          context.pushNamed(ProgressTag.name);
                          ref
                              .read(localDataProvider)
                              .saveTagProgress("inProgress");
                        },
                      );
                    },
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 20),
                    separatorBuilder: (_, index) => 10.heightBox,
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (index, _) {
                      return MyTagWidget(
                        onTap: () {
                          context.pushNamed(ProgressTag.name);
                          ref
                              .read(localDataProvider)
                              .saveTagProgress("delivered");
                        },
                      );
                    },
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
