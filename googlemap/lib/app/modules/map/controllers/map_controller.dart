import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/app/services/directions_model.dart';
import 'package:googlemap/app/services/directions_repository.dart';

class MapController extends GetxController {
  final initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  late GoogleMapController googleMapController;

  Rx<Marker> origin = Marker(markerId: MarkerId('awal')).obs;
  Rx<Marker> destination = Marker(markerId: MarkerId('akhir')).obs;

  Rx<Directions> info = Directions().obs;

  final awal = "".obs;
  final akhir = "".obs;

  final inf = "".obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    googleMapController.dispose();
  }

  void addMarker(LatLng pos)async{
    if(awal.value == "" || (awal.value != "" && akhir.value != "")){
      origin.value = Marker(
          markerId: MarkerId('origin'),
          infoWindow: InfoWindow(title: "Origin"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos
      );
      awal.value = "awal";
      akhir.value = "";

      info.value = Directions();
      print(info.value.totalDuration);
      print(info.value.totalDistance);
      print(info.value.polylinePoints);
      print(info.value.bounds);
      inf.value = "";
    }else{
      destination.value = Marker(
          markerId: MarkerId('destination'),
          infoWindow: InfoWindow(title: "Destination"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          position: pos
      );
      akhir.value = "akhir";

      final directions = await DirectionsRepository().getDirections(origin.value.position, pos);

      info.value = await directions!;
      inf.value = "asad";
    }
  }
}
