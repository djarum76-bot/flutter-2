import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  TextEditingController searchController = TextEditingController();

  final Marker kGooglePlexMarker = Marker(
      markerId: MarkerId('kGooglePlex'),
      infoWindow: InfoWindow(title: 'Google Plex'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(37.42796133580664, -122.085749655962)
  );

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Marker kLakeMarker = Marker(
      markerId: MarkerId('kLake'),
      infoWindow: InfoWindow(title: 'Lake'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(37.43296265331129, -122.08832357078792)
  );

  final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );

  final Polyline kPolyline = Polyline(
      polylineId: PolylineId('kPolyline'),
      points:[
        LatLng(37.42796133580664, -122.085749655962),
        LatLng(37.43296265331129, -122.08832357078792),
      ],
      color: Colors.red,
      width: 5
  );

  final Polygon kPolygon = Polygon(
      polygonId: PolygonId('kPolygon'),
      points: [
        LatLng(37.42796133580664, -122.085749655962),
        LatLng(37.43296265331129, -122.08832357078792),
        LatLng(37.43296265331129, -122.09032357078792),
      ],
      strokeWidth: 5,
      fillColor: Colors.transparent
  );

  Future<void> goToTheLake()async{
    final GoogleMapController googleMapController = await controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(kLake)
    );
  }



  //COBA - COBA
  // Rx<Marker> origin = Marker(markerId: MarkerId('awal')).obs;
  // Rx<Marker> destination = Marker(markerId: MarkerId('akhir')).obs;
  //
  // final awal = "".obs;
  // final akhir = "".obs;
  //
  // void addMarker(LatLng pos){
  //   if(awal.value == "" || (awal.value != "" && akhir.value != "")){
  //     origin.value = Marker(
  //         markerId: MarkerId('origin'),
  //         infoWindow: InfoWindow(title: 'Origin'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos
  //     );
  //     awal.value = "awal";
  //     akhir.value = "";
  //   }else{
  //     destination.value = Marker(
  //       markerId: MarkerId('destination'),
  //       infoWindow: InfoWindow(title: 'Destination'),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //       position: pos
  //     );
  //     akhir.value = "akhir";
  //   }
  // }
}
