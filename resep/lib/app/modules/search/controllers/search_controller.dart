import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep/app/controllers/service_controller.dart';
import 'package:resep/app/models/recipes_models.dart';

class SearchController extends GetxController {
  late TextEditingController search;

  final serviceC = Get.find<ServiceController>();
  final cari = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    search = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    search.dispose();
  }

  getRecipes()async{
    final response = await dio.get('/api/recipes',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.recipes(RecipesModel.fromJson(data));
      serviceC.recipes.refresh();
    }
  }

  getRecipesBySearch(String key)async{
    final response = await dio.get('/api/search/?q=${key}',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.searchRecipes(RecipesModel.fromJson(data));
      serviceC.searchRecipes.refresh();
    }
  }
}
