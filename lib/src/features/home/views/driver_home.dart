import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../const/colors.dart';
import '../../../core/local/local_storage_repository.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/inter_text.dart';
import '../../../widgets/primary_white_container.dart';
import '../../tag/views/progress_tag.dart';

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
                  showDragHandle: true,
                  context: context,
                  builder: (_) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Color(0xffF8F8FA),
                      ),
                      height: 270,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const PrimaryWhiteContainer(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  getRow(
                                      text: "Tag", info: "Walnut Workstation"),
                                  getRow(text: "Dimension", info: "50” X 70”"),
                                  getRow(text: "Notes", info: "Wooden"),
                                  getRow(text: "Package Size", info: "20kg"),
                                  getRow(text: "Delivery Time", info: "Urgent"),
                                  getRow(
                                      text: "Sender Point",
                                      info: "7529 E. Pecan St."),
                                  getRow(
                                      text: "Receiver Point",
                                      info: "7529 E. Pecan St."),
                                  getRow(
                                      text: "Total Distance", info: "5.2 km"),
                                  getRow(text: "Delivery Fare", info: "\$20"),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  "https://plus.unsplash.com/premium_vector-1721289859111-870a76649cba?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                            ),
                            30.heightBox,
                            AppButton(
                              onPressed: () {},
                              text: "Accept",
                            ),
                          ],
                        ),
                      ),
                    );
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
