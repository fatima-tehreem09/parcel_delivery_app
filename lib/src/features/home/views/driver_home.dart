import 'package:abiola_along_client_app/src/features/home/widgets/bottomsheet_tag_data.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../const/colors.dart';
import '../../../core/local/local_storage_repository.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/inter_text.dart';

class DriverHome extends ConsumerStatefulWidget {
  const DriverHome({super.key});

  @override
  ConsumerState createState() => _DriverHomeState();
}

class _DriverHomeState extends ConsumerState<DriverHome> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final LatLng _latLng = LatLng(30.201106652712188, 71.5038758);
  final double _zoom = 15.0;
  final double offset = 50;
  final double height = 75;
  final double width = 150;

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver: $isDriver  ");
    final markerId = MarkerId("marker_id");
    _markers.add(
      Marker(
        markerId: markerId,
        position: _latLng,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  enableDrag: true,
                  context: context,
                  useRootNavigator: true,
                  builder: (_) {
                    return BottomSheetTagData();
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xff1F2937),
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
            _latLng,
          );
        },
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(
        onTap: () {
          // ref.read(mapProvider.notifier).updateMapCenter(
          //   LatLng(30.201106652712188, 71.5038758),
          // );
          //
          // ref.read(mapProvider.notifier).addMarker(
          //   LatLng(33.72148, 73.04329),
          // );
        },
        isDriver: isDriver,
        isHomeView: true,
        title: "Home",
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
              controller.showMarkerInfoWindow(markerId);
            },
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            // (top, left, width, height) => null,
            controller: _customInfoWindowController,
          ),
        ],
      ),
    );
  }
}
