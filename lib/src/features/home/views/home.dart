import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/views/driver_home.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/my_tag_widget.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/app_textfield.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import '../../../core/local/local_storage_repository.dart';
import '../../../utils/perimission_location.dart';

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
  String _currentAddress = "....";
  Position? _currentPosition;

  Future<void> _getCurrentPosition() async {
    final hasPermission = await ref
        .read(locationPermissionProvider)
        .handleLocationPermission(context);
    if (!hasPermission) return;
    try {
      final position = await Geolocator.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high));
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng(position);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      final placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      final place = placemarks[0];
      setState(() {
        _currentAddress =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.postalCode}";
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver: $isDriver  ");

    return !isDriver
        ? Scaffold(
            backgroundColor: AppColors.primaryScaffoldBg,
            appBar: AppBarWidget(
              location: _currentAddress,
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
