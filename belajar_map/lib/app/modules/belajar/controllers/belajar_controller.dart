import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BelajarController extends GetxController {
  final posisi = CameraPosition(
      target: LatLng(53.4308294,-2.96083),
      zoom: 15
  );

  Location location = Location();
  late GoogleMapController googleMapController;

  void onMapCreated(GoogleMapController _cntlr)
  {
    googleMapController = _cntlr;
    location.onLocationChanged.listen((l) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!),zoom: 15),
        ),
      );
    });
  }
}
