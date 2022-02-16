import 'package:belajar_map/app/services/location_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        controller: controller.searchController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: "Search by city"
                        ),
                        onChanged: (value){
                        },
                      )
                  ),
                  IconButton(
                      onPressed: (){
                        LocationService().getPlaceId(controller.searchController.text);
                      },
                      icon: Icon(Icons.search)
                  )
                ],
              ),
              Expanded(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: controller.kGooglePlex,
                    onMapCreated: (GoogleMapController controller12) {
                      controller.controller.complete(controller12);
                    },
                    markers: {
                      controller.kGooglePlexMarker,
                      // controller.kLakeMarker
                    },
                    zoomControlsEnabled: false,
                    // polylines: {
                    //   controller.kPolyline
                    // },
                    // polygons: {
                    //   controller.kPolygon
                    // },
                  )
              )
            ],
          )
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: controller.goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../controllers/home_controller.dart';
//
// class HomeView extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Obx((){
//             return controller.awal.value != ""
//                 ? IconButton(
//                       onPressed: ()async{
//                         final GoogleMapController googleMapController = await controller.controller.future;
//                         googleMapController.animateCamera(
//                           CameraUpdate.newCameraPosition(
//                             CameraPosition(
//                                 target: LatLng(controller.origin.value.position.latitude, controller.origin.value.position.longitude),
//                                 zoom: 14.4746
//                             )
//                           )
//                         );
//                       },
//                       icon: Icon(Icons.person),
//                   )
//                 : SizedBox();
//           }),
//           Obx((){
//             return controller.akhir.value != ""
//                 ? IconButton(
//                       onPressed: ()async{
//                         final GoogleMapController googleMapController = await controller.controller.future;
//                         googleMapController.animateCamera(
//                           CameraUpdate.newCameraPosition(
//                             CameraPosition(
//                                 target: LatLng(controller.destination.value.position.latitude, controller.destination.value.position.longitude),
//                                 zoom: 14.4746
//                             )
//                           )
//                         );
//                       },
//                       icon: Icon(Icons.person_add)
//                   )
//                 : SizedBox();
//           })
//         ],
//       ),
//       body: Obx((){
//         return GoogleMap(
//           mapType: MapType.normal,
//           initialCameraPosition: controller.kGooglePlex,
//           onMapCreated: (GoogleMapController controller12) {
//             controller.controller.complete(controller12);
//           },
//           zoomControlsEnabled: false,
//           markers: {
//             if(controller.awal.value != "") controller.origin.value,
//             if(controller.akhir.value != "") controller.destination.value
//           },
//           onLongPress: controller.addMarker,
//         );
//       }),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: controller.goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }
// }

