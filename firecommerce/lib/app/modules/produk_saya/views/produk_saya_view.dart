import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/produk_saya_controller.dart';

class ProdukSayaView extends GetView<ProdukSayaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Get.height * 0.02),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.04,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          width: Get.height * 0.04901960784,
                          height: Get.height * 0.04901960784,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(LineIcons.arrowLeft, size: 30,),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                          "Produk Saya",
                          style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: Container(
                    child: StreamBuilder<QuerySnapshot<Object?>>(
                        stream: controller.streamProduct(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState == ConnectionState.active){
                            var listAllDocs = snapshot.data!.docs;
                            return GridView.builder(
                                itemCount: listAllDocs.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15
                                ),
                                itemBuilder: (context, index){
                                  var data = listAllDocs[index].data() as Map<String, dynamic>;
                                  return InkWell(
                                    onTap: (){
                                      Get.toNamed(Routes.DETAIL, arguments: listAllDocs[index].id);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      height: Get.height,
                                      width: Get.height * 0.22,
                                      child: Column(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                    ),
                                                    image: DecorationImage(
                                                        image: NetworkImage("${data["gambar"]}"),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                                margin: EdgeInsets.only(top: Get.height * 0.01, left: Get.height * 0.01, right: Get.height * 0.01),
                                              )
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(20),
                                                  bottomRight: Radius.circular(20)
                                              ),
                                            ),
                                            margin: EdgeInsets.only(bottom: Get.height * 0.01, left: Get.height * 0.01, right: Get.height * 0.01),
                                            width: Get.width,
                                            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015, vertical: Get.height * 0.01),
                                            height: Get.height * 0.08,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${data["nama_produk"]}",
                                                  style: GoogleFonts.openSans(fontSize: 16),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                ),
                                                Text(
                                                  "${controller.formatCurrency.format(data["harga"])}",
                                                  style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
