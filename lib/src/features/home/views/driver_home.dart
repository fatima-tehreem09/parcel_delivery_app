import 'package:abiola_along_client_app/src/features/home/widgets/bottomsheet_tag_data.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../const/colors.dart';
import '../../../core/local/local_storage_repository.dart';
import '../../../utils/google_map_util.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/inter_text.dart';

class DriverHome extends ConsumerStatefulWidget {
  const DriverHome({super.key});

  @override
  ConsumerState createState() => _DriverHomeState();
}

class _DriverHomeState extends ConsumerState<DriverHome> {
  @override
  void initState() {
    super.initState();
    ref.read(locationNotifierProvider.notifier).getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDriver = ref.watch(localDataProvider).getUserType == "driver";
    final location = ref.watch(locationNotifierProvider);
    final state = ref.read(locationNotifierProvider.notifier);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(
        location: location.currentAddress ?? "....",
        onTap: state.getCurrentPosition,
        isDriver: isDriver,
        isHomeView: true,
        title: "Home",
      ),
      body: location.initialLatLng == null
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            )
          : Stack(
              children: <Widget>[
                GoogleMap(
                  onTap: (position) {
                    state.customInfoWindowController.hideInfoWindow!();
                  },
                  onCameraMove: (position) {
                    state.customInfoWindowController.onCameraMove!();
                  },
                  onCameraIdle: () async {
                    final position = await state
                        .customInfoWindowController.googleMapController
                        ?.getLatLng(
                      ScreenCoordinate(
                        x: MediaQuery.of(context).size.width ~/ 2,
                        y: MediaQuery.of(context).size.height ~/ 2,
                      ),
                    );
                    if (position != null) {
                      state.updateCurrentAddress(position);
                    }
                  },
                  onMapCreated: (GoogleMapController controller) async {
                    state.customInfoWindowController.googleMapController =
                        controller;
                    controller
                        .showMarkerInfoWindow(const MarkerId("marker_id"));
                    if (location.currentPosition != null) {
                      state.animateToCurrentLocation(location.currentPosition!);
                    }
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId("marker_id"),
                      position: location.initialLatLng!,
                      onTap: () {
                        state.customInfoWindowController.addInfoWindow!(
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                useRootNavigator: false,
                                isScrollControlled: true,
                                enableDrag: true,
                                context: context,
                                builder: (_) {
                                  return const BottomSheetTagData();
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xff1F2937),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: InterText(
                                  "3.5 Miles",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryWhite,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                          location.initialLatLng!,
                        );
                      },
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    target: location.initialLatLng ?? const LatLng(0, 0),
                    zoom: location.zoom ?? 14,
                  ),
                ),
                CustomInfoWindow(
                  controller: state.customInfoWindowController,
                ),
              ],
            ),
    );
  }
}
