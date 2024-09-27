import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/views/driver_home.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/my_tag_widget.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/app_textfield.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/local/local_storage_repository.dart';

class Home extends ConsumerStatefulWidget {
  const Home.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/home";
  static const name = "home";

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver: $isDriver  ");

    return !isDriver
        ? Scaffold(
            backgroundColor: AppColors.primaryScaffoldBg,
            appBar: AppBarWidget(
              isDriver: isDriver,
              isHomeView: true,
              title: "Home",
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTextField(
                    isSearchField: true,
                    hint: "Search",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                  ),
                  20.heightBox,
                  OnestText(
                    "My Tags",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlack,
                  ),
                  20.heightBox,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 10.heightBox,
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (index, context) {
                        return MyTagWidget(
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : const DriverHome();
  }
}
