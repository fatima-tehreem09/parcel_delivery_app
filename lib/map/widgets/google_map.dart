import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/map_provider.dart';

class GoogleMaps extends ConsumerWidget {
  const GoogleMaps({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapProvider);
    final notifier = ref.watch(mapProvider.notifier);

    // Check if there are any polygons or polylines to display
    bool hasPolylines = state.polylines.isNotEmpty;
    bool hasPolygons = state.polygons.isNotEmpty;
    return map.GoogleMap(
      markers: state.markers,
      zoomControlsEnabled: true,
      onTap: notifier.onMapTap,
      mapType: map.MapType.normal,
      polygons: hasPolygons ? state.polygons : {},
      polylines: hasPolylines ? state.polylines : {},
      circles: makeCircles(notifier.polygonPoints + notifier.polylinePoints),
      onMapCreated: notifier.finalizeController,
      initialCameraPosition: const map.CameraPosition(
        zoom: 17, // Initial zoom level
        target: map.LatLng(30.201106652712188, 71.5038758),
      ),
    );
  }

  Set<map.Circle> makeCircles(List<LatLng> positions) {
    return positions.map((e) {
      return map.Circle(
        center: e,
        radius: 6,
        strokeWidth: 2,
        circleId: CircleId('c-(${e.longitude}, ${e.latitude})'),
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.8),
      );
    }).toSet();
  }
}
