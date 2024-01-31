import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends Marker {
  final String title;
  final String description;

  CustomMarker({
    required MarkerId markerId,
    required LatLng position,
    this.title = '',
    this.description = '',
  }) : super(markerId: markerId, position: position);
}

class MapMarkers {
  static Future<Set<Marker>> getMarkers(BuildContext context) async {
    final Set<Marker> markers = {};

    markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(-9.666282768347779, -35.71256467324942),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(-8.43556997709722, -34.980922574656766),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker3'),
        position: LatLng(-22.973748808300346, -43.37180711771569),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker4'),
        position: LatLng(-15.786823522426989, -47.82888516294367),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker5'),
        position: LatLng(-34.587689564265304, -58.38871775816824),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker6'),
        position: LatLng(-30.954250077743477, -55.558409089052795),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker7'),
        position: LatLng(-28.686956259156627, -49.33448651800165),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker8'),
        position: LatLng(-9.532738764407494, -77.53226886498751),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ),
    );

    return markers;
  }
}
