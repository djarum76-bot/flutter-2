import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resep/app/custom/detail_item.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getRecipe(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  var data = controller.serviceC.recipe.value.results;
                  return Container(
                    padding: EdgeInsets.all(Get.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Icon(LineIcons.arrowLeft, size: 35,)
                          ),
                        ),
                        SizedBox(height: 20,),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: Get.width,
                            height: Get.height * 0.3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${Get.arguments[1]}'),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(20),
                          child: ListTile(
                            title: Text(
                              "${data!.author!.user}",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20
                              ),
                            ),
                            subtitle: Text(
                              "${data.author!.datePublished}",
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(Get.height * 0.02),
                                child: ListView(
                                  children: [
                                    Text(
                                      "${data.title}",
                                      style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        DetailItem(
                                          icon: Icon(LineIcons.clock, color: Colors.black, size: 60,),
                                          isi: "${data.times}",
                                          warna: Color(0xFFF7ECDE),
                                        ),
                                        DetailItem(
                                          icon: ImageIcon(AssetImage('asset/porsi.png'), size: 60, color: Colors.black,),
                                          isi: "${data.servings}",
                                          warna: Color(0xFFD6E5FA),
                                        ),
                                        DetailItem(
                                          icon: ImageIcon(AssetImage('asset/tingkat.png'), size: 60, color: Colors.black,),
                                          isi: "${data.dificulty}",
                                          warna: Color(0xFFC1FFD7),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      "Bahan - Bahan",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    ListView.builder(
                                        itemCount: data.ingredient!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index){
                                          return index != data.ingredient!.length-1
                                              ? Container(
                                                  padding: EdgeInsets.only(bottom: Get.height * 0.006),
                                                  child: Text(
                                                      "${data.ingredient![index]}",
                                                      style: GoogleFonts.openSans(),
                                                      textAlign: TextAlign.justify,
                                                  ),
                                                )
                                              : Container(
                                                  child: Text(
                                                      "${data.ingredient![index]}",
                                                      style: GoogleFonts.openSans(),
                                                      textAlign: TextAlign.justify,
                                                  ),
                                                );
                                        }
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      "Langkah - Langkah",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    ListView.builder(
                                        itemCount: data.step!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index){
                                          return index != data.step!.length-1
                                              ? Container(
                                                  padding: EdgeInsets.only(bottom: Get.height * 0.008),
                                                  child: Text(
                                                      "${data.step![index]}",
                                                      style: GoogleFonts.openSans(),
                                                      textAlign: TextAlign.justify,
                                                  ),
                                                )
                                              : Container(
                                                  child: Text(
                                                      "${data.step![index]}",
                                                      style: GoogleFonts.openSans(),
                                                      textAlign: TextAlign.justify,
                                                  ),
                                          );
                                        }
                                    )
                                  ],
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          )
      ),
    );
  }
}
