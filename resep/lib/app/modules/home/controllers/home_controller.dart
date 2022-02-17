import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep/app/controllers/service_controller.dart';
import 'package:resep/app/models/category_models.dart';
import 'package:resep/app/models/recipes_models.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin{
  late TabController tabController;

  final serviceC = Get.find<ServiceController>();

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 10, vsync: this);
    super.onInit();
  }

  getCategory()async{
    final response = await dio.get('/api/categorys/recipes',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.category(CategoryModel.fromJson(data));
      serviceC.category.refresh();
    }
  }

  getDesert()async{
    final response = await dio.get('/api/categorys/recipes/resep-dessert',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.desert(RecipesModel.fromJson(data));
      serviceC.desert.refresh();
    }
  }

  getHariRaya()async{
    final response = await dio.get('/api/categorys/recipes/masakan-hari-raya',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.hariRaya(RecipesModel.fromJson(data));
      serviceC.hariRaya.refresh();
    }
  }

  getTradisional()async{
    final response = await dio.get('/api/categorys/recipes/masakan-tradisional',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.tradisional(RecipesModel.fromJson(data));
      serviceC.tradisional.refresh();
    }
  }

  getMakanMalam()async{
    final response = await dio.get('/api/categorys/recipes/makan-malam',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.makanMalam(RecipesModel.fromJson(data));
      serviceC.makanMalam.refresh();
    }
  }

  getMakanSiang()async{
    final response = await dio.get('/api/categorys/recipes/makan-siang',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.makanSiang(RecipesModel.fromJson(data));
      serviceC.makanSiang.refresh();
    }
  }

  getAyam()async{
    final response = await dio.get('/api/categorys/recipes/resep-ayam',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.ayam(RecipesModel.fromJson(data));
      serviceC.ayam.refresh();
    }
  }

  getDaging()async{
    final response = await dio.get('/api/categorys/recipes/resep-daging',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.daging(RecipesModel.fromJson(data));
      serviceC.daging.refresh();
    }
  }

  getSayuran()async{
    final response = await dio.get('/api/categorys/recipes/resep-sayuran',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.sayuran(RecipesModel.fromJson(data));
      serviceC.sayuran.refresh();
    }
  }

  getSeafood()async{
    final response = await dio.get('/api/categorys/recipes/resep-seafood',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.seafood(RecipesModel.fromJson(data));
      serviceC.seafood.refresh();
    }
  }

  getSarapan()async{
    final response = await dio.get('/api/categorys/recipes/sarapan',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.sarapan(RecipesModel.fromJson(data));
      serviceC.sarapan.refresh();
    }
  }
}
