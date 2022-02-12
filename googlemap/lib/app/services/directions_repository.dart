import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/app/services/directions_model.dart';

class DirectionsRepository{
  final baseUrl = 'https://maps.googleapis.com/maps/api/directions/json?';

  Dio dio = Dio();

  Future<Directions?> getDirections(LatLng origin, LatLng destination)async{
    final response = await dio.get(
      baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': 'AIzaSyAPor0EthoalIWJUmwzeswzkQ01BRkfIxk'
      }
    );

    if(response.statusCode == 200){
      print('asd');
      return Directions.fromMap(response.data);
    }
    return null;
  }
}