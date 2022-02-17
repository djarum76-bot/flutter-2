import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:resep/app/models/category_models.dart';
import 'package:resep/app/models/recipe_models.dart';
import 'package:resep/app/models/recipes_models.dart';

var options = BaseOptions(
  baseUrl: 'https://masak-apa.tomorisakura.vercel.app',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class ServiceController extends GetxController {
  final category = CategoryModel().obs;
  final recipes = RecipesModel().obs;
  final recipe = RecipeModel().obs;

  final searchRecipes = RecipesModel().obs;

  final desert = RecipesModel().obs;
  final hariRaya = RecipesModel().obs;
  final tradisional = RecipesModel().obs;
  final makanMalam = RecipesModel().obs;
  final makanSiang = RecipesModel().obs;
  final ayam = RecipesModel().obs;
  final daging = RecipesModel().obs;
  final sayuran = RecipesModel().obs;
  final seafood = RecipesModel().obs;
  final sarapan = RecipesModel().obs;
}
