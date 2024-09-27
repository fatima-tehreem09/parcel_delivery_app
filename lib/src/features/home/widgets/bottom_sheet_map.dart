import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/google_map_util.dart';

class BottomSheetMap extends ConsumerStatefulWidget {
  const BottomSheetMap({super.key});

  @override
  ConsumerState createState() => _BottomSheetMapState();
}

class _BottomSheetMapState extends ConsumerState<BottomSheetMap> {
  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationNotifierProvider);
    final state = ref.read(locationNotifierProvider.notifier);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GoogleMap(
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
          state.customInfoWindowController.googleMapController = controller;
          controller.showMarkerInfoWindow(const MarkerId("marker_id"));
          if (location.currentPosition != null) {
            state.animateToCurrentLocation(location.currentPosition!);
          }
        },
        initialCameraPosition: CameraPosition(
          target: location.initialLatLng ?? const LatLng(0, 0),
          zoom: location.zoom ?? 14,
        ),
      ),
    );
  }
}
