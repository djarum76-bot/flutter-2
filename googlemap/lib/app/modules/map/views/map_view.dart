import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/app/services/directions_model.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Google Maps"),
        actions: [
          Obx((){
            return controller.awal.value != ""
                ? TextButton(
                      onPressed: (){
                        controller.googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target: controller.origin.value.position,
                              zoom: 14.4746,
                              tilt: 50
                          ))
                        );
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.green,
                          textStyle: TextStyle(fontWeight: FontWeight.w600)
                      ),
                      child: Text("Origin")
                  )
                : SizedBox();
          }),
          Obx((){
            return controller.akhir.value != ""
                ? TextButton(
                onPressed: (){
                  controller.googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: controller.destination.value.position,
                          zoom: 14.4746,
                          tilt: 50
                      )
                    )
                  );
                },
                style: TextButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    textStyle: TextStyle(fontWeight: FontWeight.w600)
                ),
                child: Text("Destination")
            )
                : SizedBox();
          })
        ],
      ),
      body: Stack(
        children: [
          Obx((){
            return GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: controller.initialCameraPosition,
              onMapCreated: (controller12) => controller.googleMapController = controller12,
              markers: {
                if(controller.awal.value != "") controller.origin.value,
                if(controller.akhir.value != "") controller.destination.value,
              },
              polylines: {
                if(controller.inf.value != "")
                  Polyline(
                      polylineId: PolylineId('overview_polyline'),
                      color: Colors.red,
                      width: 5,
                      points: controller.info.value.polylinePoints!.map((e) => LatLng(e.latitude, e.longitude)).toList()
                  )
              },
              onLongPress: controller.addMarker,
            );
          }),
          Obx((){
            return controller.inf.value != "" && controller.info.value != Directions()
                ? Positioned(
                      top: 20,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6
                            )
                          ]
                        ),
                        child: Text(
                          "${controller.info.value.totalDistance}, ${controller.info.value.totalDuration}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                  )
                : SizedBox();
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.googleMapController.animateCamera(
              controller.info.value != Directions()
                  ? CameraUpdate.newLatLngBounds(controller.info.value.bounds!, 100)
                  : CameraUpdate.newCameraPosition(controller.initialCameraPosition)
            );
          },
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.center_focus_strong
          ),
      ),
    );
  }
}
