import 'package:abiola_along_client_app/src/widgets/error_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final locationPermissionProvider = Provider<LocationPermissionUtil>((ref) {
  return LocationPermissionUtil();
});

class LocationPermissionUtil {
  Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      const ErrorDialog(
        error: "Location services are disabled. Please enable the services",
      ).show(context);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const ErrorDialog(
          error: "Location permissions are denied",
        ).show(context);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      const ErrorDialog(
        error:
            "Location permissions are permanently denied, we cannot request permissions.",
      ).show(context);
    }
    return true;
  }
}
