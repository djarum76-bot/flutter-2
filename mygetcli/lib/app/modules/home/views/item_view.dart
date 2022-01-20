import 'package:flutter/material.dart';
import 'package:mygetcli/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:mygetcli/app/modules/home/controllers/home_controller.dart';

class ItemView extends GetView<HomeController> {
  final data;

  ItemView({this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Get.toNamed(Routes.EDIT, arguments: data.id!);
      },
      leading: CircleAvatar(),
      title: Text(data.name!),
      subtitle: Text(data.createdAt!),
      trailing: IconButton(
          onPressed: (){
            controller.delete(data.id!);
          },
          icon: Icon(Icons.delete)
      ),
    );
  }
}
