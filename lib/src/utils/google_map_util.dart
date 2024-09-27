import 'package:abiola_along_client_app/src/utils/perimission_location.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_map_util.freezed.dart';
part 'google_map_util.g.dart';

@Freezed()
class LocationState with _$LocationState {
  const factory LocationState({
    Position? currentPosition,
    String? currentAddress,
    LatLng? initialLatLng,
    double? zoom,
  }) = _LocationState;
}

@riverpod
class LocationNotifier extends _$LocationNotifier {
  final CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  @override
  LocationState build() {
    return const LocationState();
  }

  @override
  void dispose() {
    customInfoWindowController.dispose();
  }

  Future<void> updateCurrentAddress(LatLng position) async {
    try {
      final placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      final place = placemarks[0];
      state = state.copyWith(
        currentAddress:
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.postalCode}",
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getCurrentPosition() async {
    final hasPermission =
        await ref.read(locationPermissionProvider).handleLocationPermission();
    if (!hasPermission) return;

    try {
      final position = await Geolocator.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high));

      state = state.copyWith(
        currentPosition: position,
        initialLatLng: LatLng(position.latitude, position.longitude),
      );

      await getAddressFromLatLng(position);
      animateToCurrentLocation(position);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void animateToCurrentLocation(Position position) {
    customInfoWindowController.googleMapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(position.latitude, position.longitude),
      ),
    );
  }

  Future<void> getAddressFromLatLng(Position position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final place = placemarks[0];
      state = state.copyWith(
        currentAddress:
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.postalCode}",
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
