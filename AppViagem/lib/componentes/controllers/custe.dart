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