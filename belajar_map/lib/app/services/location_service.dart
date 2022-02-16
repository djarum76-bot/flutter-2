import 'package:dio/dio.dart';

class LocationService{
  final String key = "AIzaSyAPor0EthoalIWJUmwzeswzkQ01BRkfIxk";

  Dio dio = Dio();

  Future<String> getPlaceId(String input)async{
    final String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    final response = await dio.get(url);

    final json = response.data;

    final placeId = json['candidates'][0]['place_id'] as String;

    print(placeId);

    return placeId;
  }

  // Future<Map<String, dynamic>> getPlace(String input)async{
  //
  // }
}