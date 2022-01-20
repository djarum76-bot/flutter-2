import 'package:get/get.dart';


class ProductProvider extends GetConnect {
  String url = 'https://getconnect-project-28f37-default-rtdb.asia-southeast1.firebasedatabase.app/';

  Future<void> editProduct(String id, String name) async {
    await patch('$url' + 'product.json/$id',{
      "name":name
    });
  }

  Future<dynamic> postProduct(String name,String date) async{

    final response = await post('$url'+'product.json', {
      "name":name,
      "createdAt":date,
    });

    return response.body;
  }

  Future<void> deleteProduct(String id) async =>
      await delete('$url' + 'product.json/$id');
}
