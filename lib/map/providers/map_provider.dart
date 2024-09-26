import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.freezed.dart';
part 'map_provider.g.dart';

@freezed
sealed class MapState with _$MapState {
  const factory MapState({
    @Default({}) Map<dynamic, dynamic> generalState,
    @Default('') String direction,
    @Default({}) Set<Circle> circles,
    @Default({}) Set<Marker> markers,
    @Default({}) Set<Polygon> polygons,
    @Default({}) Set<Polyline> polylines,
    @Default(false) bool isPolygonMode,
  }) = _MapState;
}

@Riverpod(keepAlive: true)
final class map extends _$map {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  static const _serverPolylineId = 'server_polyline';

  @override
  MapState build() {
    return MapState();
  }

  void updateMapCenter(LatLng coordinates) async {
    (await _controller.future).animateCamera(
      CameraUpdate.newLatLng(coordinates),
    );
  }

  void addMarker(LatLng coordinates) {
    BitmapDescriptor customIcon;
    // customIcon = BitmapDescriptor.asset(
    //     ImageConfiguration(size: Size(12, 12)), AppAssets.pinPng);
    state = state.copyWith(
      markers: {
        ...state.markers,
        Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId('selected_location'),
          position: coordinates,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                height: 300,
                color: Colors.green,
                child: Column(
                  children: [
                    Text('4.5 Miles'),
                    Text('4.5 Miles'),
                    Text('4.5 Miles'),
                    Text('4.5 Miles'),
                  ],
                ),
              ),
              LatLng(coordinates.latitude, coordinates.longitude),
            );
          },
        )
      },
    );
  }

  void addServerPolyline(List<dynamic> coordinates) {
    state = state.copyWith(
      polylines: state.polylines
          .where((e) => e.polylineId.value != _serverPolylineId)
          .toSet()
        ..add(
          _createPolyline(coordinates, _serverPolylineId),
        ),
    );
  }

  Polyline _createPolyline(List<dynamic> coordinates, String id) {
    var polylinePoints = coordinates.map((latLngArray) {
      return LatLng(
        double.parse(latLngArray[0].toString()),
        double.parse(latLngArray[1].toString()),
      );
    }).toList();

    return Polyline(
      polylineId: PolylineId(id),
      points: polylinePoints,
      color: Colors.red, // Different color for server polylines
      width: 2,
    );
  }

  bool get hasDrawing => polygonPoints.isNotEmpty || polylinePoints.isNotEmpty;

//
//   // Temporarily disable tap events during async operations
//   void blockClick() async {
//     setState(() {
//       parentTap = !parentTap; // Toggle parent tap indicator
//     });
//     await Future.delayed(Duration()); // Wait for async operation to complete
//     setState(() {
//       parentTap = !parentTap; // Re-enable tap events
//     });
//   }
//
  // Toggle drawing mode between polygons and polylines
  void toggleDrawingMode() {
    state = state.copyWith(isPolygonMode: !state.isPolygonMode);
  }

  void onMapTap(LatLng point) {
    if (!_tapEnabled) {
      return;
    }
    if (state.isPolygonMode) {
      // state = state.copyWith(polygoneCircles: {
      //   ...state.polygoneCircles,
      //   Circle(
      //     circleId: CircleId('polygon-point${state.polygoneCircles.length}'),
      //     center: point,
      //     radius: 10,
      //     fillColor: Colors.redAccent.withOpacity(0.5),
      //     strokeColor: Colors.redAccent,
      //     strokeWidth: 1,
      //   ),
      // });

      polygonPoints.add(point); // Add point to polygon list
      _updatePolygon(); // Refresh the polygon drawing

      if (polygonPoints.length > 2) {
        String data = '';
        for (var i = 0; i < polygonPoints.length; i++) {
          var point = polygonPoints[i];
          data += '(${point.latitude},${point.longitude}), ';
        }

        _polygonPointData = data;
        send();
      }
    } else {
      polylinePoints.add(point); // Add point to polyline list
      _updatePolyline(); // Refresh the polyline drawing
    }
  }

  void removeLastPoint() {
    if (state.isPolygonMode && polygonPoints.isNotEmpty) {
      polygonPoints.removeLast();
      _updatePolygon();

      if (polygonPoints.length > 2) {
        String data = '';
        for (var i = 0; i < polygonPoints.length; i++) {
          var point = polygonPoints[i];
          data += '(${point.latitude},${point.longitude}), ';
        }

        _polygonPointData = data;
        send();
      }
    } else if (!state.isPolygonMode && polylinePoints.isNotEmpty) {
      polylinePoints.removeLast();
      _updatePolyline();
    }
  }

  void clearPoints() {
    if (state.isPolygonMode) {
      polygonPoints.clear();
      state = state.copyWith(
        polygons: {},
        polylines: state.polylines
            .where((e) => e.polylineId.value != _serverPolylineId)
            .toSet(),
      );
    }

    if (!state.isPolygonMode) {
      polylinePoints.clear();
      state = state.copyWith(polylines: {});
    }
  }

  void _updatePolygon() {
    state = state.copyWith(
      polygons: {},
      polylines: state.polylines
          .where((e) => e.polylineId.value != _serverPolylineId)
          .toSet(),
    );

    if (polygonPoints.isNotEmpty) {
      state = state.copyWith(polygons: {
        ...state.polygons,
        Polygon(
          visible: true,
          strokeWidth: 2,
          points: polygonPoints,
          consumeTapEvents: false,
          polygonId: const PolygonId('polygon'),
          strokeColor: Color.fromARGB(255, 0, 0, 0),
          fillColor: Color.fromARGB(255, 247, 203, 9)
              .withOpacity(0.75)
              .withOpacity(0.3),
        )
      });
    }
  }

  // Update the set of polylines based on current points
  void _updatePolyline() {
    state = state.copyWith(polylines: {});

    if (polylinePoints.isNotEmpty) {
      state = state.copyWith(polylines: {
        ...state.polylines,
        Polyline(
          polylineId: const PolylineId('polyline'),
          points: polylinePoints, // Set points for the polyline
          color: Color.fromARGB(255, 0, 0, 0), // Set polyline color
          width: 5, // Set polyline width
        )
      });
    }
  }

  void finalizeController(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void setDirection(String direction) {
    state = state.copyWith(direction: direction);
  }

  void send() {
    if (state.direction == '') {
      // Set default direction.
      state = state.copyWith(direction: 'E');
    }

    // Concatenate direction and polygon point data, then send.
    // _channel.sink.add('${state.direction} ,$_polygonPointData');
    print('\nMessage sent: ${state.direction}, $_polygonPointData');
  }

  void enableTap() {
    _tapEnabled = true;
  }

  void disableTap() {
    _tapEnabled = false;
  }

  var _tapEnabled = false;
  var _previousMessage = '';
  var _polygonPointData = '';
  final polygonPoints = <LatLng>[];
  final polylinePoints = <LatLng>[];

  final _controller = Completer<GoogleMapController>();
}
