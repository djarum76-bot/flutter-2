import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resep/app/routes/app_pages.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.fromLTRB(Get.height * 0.025, Get.height * 0.025, Get.height * 0.025, Get.height * 0.01),
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.025,
                  child: Center(
                    child: Text(
                      "What To Eat ?",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Get.height * 0.025),
                  width: Get.width,
                  height: Get.height * 0.0585,
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    elevation: 10,
                    child: TextFormField(
                      controller: controller.search,
                      onChanged: (value){
                        controller.cari.value = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(LineIcons.search, color: Color(0xFF1C1B1F),),
                        hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                      child: Obx((){
                        return controller.cari.value == ""
                            ? FutureBuilder(
                                  future: controller.getRecipes(),
                                  builder: (context, snapshot){
                                    if(snapshot.connectionState == ConnectionState.done){
                                      var data = controller.serviceC.recipes.value.results!;
                                      return GridView.builder(
                                          itemCount: 10,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.83,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20
                                          ),
                                          itemBuilder: (context, index){
                                            return GestureDetector(
                                              onTap: (){
                                                Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                              },
                                              child: Column(
                                                children: [
                                                  Material(
                                                    elevation: 5,
                                                    borderRadius: BorderRadius.circular(30),
                                                    child: Container(
                                                      width: Get.width,
                                                      height: Get.height * 0.27,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(30),
                                                          color: Colors.red
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage('${data[index].thumb}'),
                                                                    fit: BoxFit.fill
                                                                ),
                                                                borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(30),
                                                                  topLeft: Radius.circular(30),
                                                                )
                                                            ),
                                                            width: Get.width,
                                                            height: Get.height * 0.2,
                                                          ),
                                                          Expanded(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomLeft: Radius.circular(30),
                                                                      bottomRight: Radius.circular(30),
                                                                    )
                                                                ),
                                                                width: Get.width,
                                                                padding: EdgeInsets.all(Get.height * 0.01),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                    Text(
                                                                      "${data[index].title}",
                                                                      style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
                                                                      maxLines: 1,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      softWrap: false,
                                                                    ),
                                                                    Text(
                                                                      "${data[index].times}, ${data[index].dificulty}",
                                                                      style: TextStyle(
                                                                          fontFamily: "SFProText",
                                                                          fontSize: 14,
                                                                          color: Color(0xFF404040)
                                                                      ),
                                                                      maxLines: 1,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      softWrap: false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                      );
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                              )
                            : FutureBuilder(
                                  future: controller.getRecipesBySearch(controller.cari.value),
                                  builder: (context, snapshot){
                                    if(snapshot.connectionState == ConnectionState.done){
                                      var data = controller.serviceC.searchRecipes.value.results!;
                                      return GridView.builder(
                                          itemCount: 10,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.83,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20
                                          ),
                                          itemBuilder: (context, index){
                                            return GestureDetector(
                                              onTap: (){
                                                Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                              },
                                              child: Column(
                                                children: [
                                                  Material(
                                                    elevation: 5,
                                                    borderRadius: BorderRadius.circular(30),
                                                    child: Container(
                                                      width: Get.width,
                                                      height: Get.height * 0.27,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(30),
                                                          color: Colors.red
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage('${data[index].thumb}'),
                                                                    fit: BoxFit.fill
                                                                ),
                                                                borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(30),
                                                                  topLeft: Radius.circular(30),
                                                                )
                                                            ),
                                                            width: Get.width,
                                                            height: Get.height * 0.2,
                                                          ),
                                                          Expanded(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomLeft: Radius.circular(30),
                                                                      bottomRight: Radius.circular(30),
                                                                    )
                                                                ),
                                                                width: Get.width,
                                                                padding: EdgeInsets.all(Get.height * 0.01),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                    Text(
                                                                      "${data[index].title}",
                                                                      style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
                                                                      maxLines: 1,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      softWrap: false,
                                                                    ),
                                                                    Text(
                                                                      "${data[index].times}, ${data[index].dificulty}",
                                                                      style: TextStyle(
                                                                          fontFamily: "SFProText",
                                                                          fontSize: 14,
                                                                          color: Color(0xFF404040)
                                                                      ),
                                                                      maxLines: 1,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      softWrap: false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                      );
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                              );
                      })
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}
