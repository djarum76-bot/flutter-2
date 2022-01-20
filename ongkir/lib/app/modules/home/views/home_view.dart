import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ongkir/app/modules/home/province_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongkir Cok'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
          label: "Provinsi",
            onFind: (String? filter) async {
              final response = await http.get(Uri.parse("https://api.rajaongkir.com/starter/province"),headers: {
                "key":"547ed56e4309f4be9765719055631071"
              });

              final data = json.decode(response.body) as Map<String, dynamic>;

              var listAllProvince = data["rajaongkir"]["results"] as List<dynamic>;

              var models = Province.fromJsonList(listAllProvince);
              return models;
            },
            onChanged: (value) => print(value!.province),
            showSearchBox: true,
            popupItemBuilder: (context, item, isSelected){
                return Container(
                  child: Text("${item.province}"),
                );
            },
          ),

          SizedBox(height: 10,),

          DropdownSearch<String>(
            showSearchBox: true,
            showClearButton: true,
            showSelectedItems: true,
            items: [
              "DKI Jakarta",
              "Jawa Barat",
              "Jawa Tengah",
              'Jawa Timur'
            ],
            label: "Kota Asal",
            onChanged: (value) => print(value),
          ),

          SizedBox(height: 20,),

          DropdownSearch<String>(
            showSearchBox: true,
            showClearButton: true,
            showSelectedItems: true,
            items: [
              "DKI Jakarta",
              "Jawa Barat",
              "Jawa Tengah",
              'Jawa Timur'
            ],
            label: "Provinsi Tujuan",
            onChanged: (value) => print(value),
          ),

          SizedBox(height: 10,),

          DropdownSearch<String>(
            showSearchBox: true,
            showClearButton: true,
            showSelectedItems: true,
            items: [
              "DKI Jakarta",
              "Jawa Barat",
              "Jawa Tengah",
              'Jawa Timur'
            ],
            label: "Kota Tujuan",
            onChanged: (value) => print(value),
          ),
        ],
      ),
    );
  }
}
