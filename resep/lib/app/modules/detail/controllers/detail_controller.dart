import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:resep/app/models/recipe_models.dart';

import '../../../controllers/service_controller.dart';

class DetailController extends GetxController {
  final serviceC = Get.find<ServiceController>();

  getRecipe()async{
    final response = await dio.get('/api/recipe/${Get.arguments[0]}',
        options: Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      serviceC.recipe(RecipeModel.fromJson(data));
      serviceC.recipe.refresh();
    }
  }
}
