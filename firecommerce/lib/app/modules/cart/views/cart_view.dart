import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamCart(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.active){
                  var listAllDocs = snapshot.data!.docs;
                  return Container(
                    padding: EdgeInsets.all(Get.height * 0.02),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
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
                                              "My Cart",
                                              style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                          child: listAllDocs.length == 0
                                              ? Center(
                                            child: Lottie.asset("asset/empty.json"),
                                          )
                                              : ListView.builder(
                                              itemCount: listAllDocs.length,
                                              itemBuilder: (context, index){
                                                var data = listAllDocs[index].data() as Map<String, dynamic>;
                                                return Container(
                                                  margin: EdgeInsets.only(bottom: Get.height * 0.02),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  width: Get.width,
                                                  height: Get.height * 0.2,
                                                  padding: EdgeInsets.all(Get.height * 0.02),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            image: DecorationImage(
                                                                image: NetworkImage("${data["gambar"]}"),
                                                                fit: BoxFit.cover
                                                            )
                                                        ),
                                                        width: Get.height * 0.1225490196,
                                                        height: Get.height,
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Container(
                                                        width: Get.height * 0.18382352941,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              "${data["nama_produk"]}",
                                                              style: GoogleFonts.openSans(
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.w600
                                                              ),
                                                              maxLines: 1,
                                                              overflow: TextOverflow.ellipsis,
                                                              softWrap: false,
                                                            ),
                                                            SizedBox(height: 10,),
                                                            Text(
                                                              "${controller.formatCurrency.format(data["harga"])}",
                                                              style: GoogleFonts.josefinSans(fontSize: 22, fontWeight: FontWeight.w700),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Align(
                                                          alignment: Alignment.topCenter,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              InkWell(
                                                                  onTap: (){
                                                                    controller.kurang(listAllDocs[index].id, data["jumlah"], data["harga"]);
                                                                  },
                                                                  child: Icon(Icons.remove)
                                                              ),
                                                              Align(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "${data["jumlah"]}",
                                                                  style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: (){
                                                                    controller.tambah(listAllDocs[index].id, data["jumlah"], data["harga"]);
                                                                  },
                                                                  child: Icon(Icons.add)
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.topCenter,
                                                        child: IconButton(
                                                            onPressed: (){
                                                              controller.hapus(listAllDocs[index].id);
                                                            },
                                                            icon: Icon(Icons.close)
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }
                                          )
                                      )
                                  ),
                                  listAllDocs.length == 0
                                      ? SizedBox()
                                      : FutureBuilder(
                                      future: Future.delayed(Duration(milliseconds: 500)),
                                      builder: (context, snapshot){
                                        if(snapshot.connectionState == ConnectionState.done){
                                          for(int i=0;i<listAllDocs.length;i++){
                                            var data = listAllDocs[i].data() as Map<String, dynamic>;
                                            int jumlah = data["harga"] * data["jumlah"];
                                            controller.total.value += jumlah;
                                          }
                                          return Obx((){
                                            return Container(
                                              height: Get.height * 0.04,
                                              margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Total",
                                                    style: GoogleFonts.josefinSans(fontSize: 26),
                                                  ),
                                                  Text(
                                                    "${controller.formatCurrency.format(controller.total.value)}",
                                                    style: GoogleFonts.josefinSans(fontSize: 22, color: Colors.deepOrangeAccent),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                        }
                                        return Container(
                                          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                          child: Center(
                                            child: Text(
                                                "Sedang mengkalkulasikan total belanja"
                                            ),
                                          ),
                                        );
                                      }
                                  )
                                ],
                              ),
                            )
                        ),
                        listAllDocs.length == 0
                            ? InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.deepOrangeAccent
                                    ),
                                    width: Get.width,
                                    height: Get.height * 0.075,
                                    child: Center(
                                      child: Text(
                                        "Back To Home",
                                        style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                          onTap: ()async{
                            for(int i=0;i<listAllDocs.length;i++){
                              await controller.beli(listAllDocs[i].id);
                            }
                            Get.toNamed(Routes.CHECKOUT);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepOrangeAccent
                              ),
                              width: Get.width,
                              height: Get.height * 0.075,
                              child: Center(
                                child: Text(
                                  "Buy Now",
                                  style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
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
