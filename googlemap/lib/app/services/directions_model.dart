import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions{
  final LatLngBounds? bounds;
  final List<PointLatLng>? polylinePoints;
  final String? totalDistance;
  final String? totalDuration;

  Directions({
    this.bounds,
    this.polylinePoints,
    this.totalDistance,
    this.totalDuration,
  });

  factory Directions.fromMap(Map<String, dynamic> map){
    // check if route is not available
    if((map['routes'] as List).isEmpty) return Directions();

    //get route information
    final data = Map<String,dynamic>.from(map['routes'][0]);

    //bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
        southwest: LatLng(southwest['lat'], southwest['lng']),
        northeast: LatLng(northeast['lat'], northeast['lng'])
    );

    //distance & duration
    String distance = "";
    String duration = "";
    if((data['legs'] as List).isEmpty){
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Directions(
        bounds: bounds,
        polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['points']),
        totalDistance: distance,
        totalDuration: duration
    );
  }
}