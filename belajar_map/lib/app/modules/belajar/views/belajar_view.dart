import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/belajar_controller.dart';

class BelajarView extends GetView<BelajarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: controller.posisi,
        onMapCreated: controller.onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
