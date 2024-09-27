import 'package:abiola_along_client_app/src/features/home/widgets/bottomsheet_tag_data.dart';
import 'package:abiola_along_client_app/src/utils/perimission_location.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  final LatLng _latLng = const LatLng(30.201106652712188, 71.5038758);
  final double _zoom = 15.0;
  String _currentAddress = "....";
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

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
      _animateToCurrentLocation(position);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _animateToCurrentLocation(Position position) {
    _customInfoWindowController.googleMapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(position.latitude, position.longitude),
      ),
    );
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
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(
        location: _currentAddress,
        onTap: _getCurrentPosition,
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
              controller.showMarkerInfoWindow(const MarkerId("marker_id"));
              if (_currentPosition != null) {
                _animateToCurrentLocation(_currentPosition!);
              }
            },
            markers: {
              Marker(
                markerId: const MarkerId("marker_id"),
                position: _latLng,
                onTap: () {
                  _customInfoWindowController.addInfoWindow!(
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
                    _latLng,
                  );
                },
              ),
            },
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
          ),
        ],
      ),
    );
  }
}
