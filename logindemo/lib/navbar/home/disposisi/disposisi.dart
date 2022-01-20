import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/disposisi/disposisiC.dart';
import 'detail_disposisi.dart';

class Disposisi extends StatelessWidget {
   final disposisiC = Get.put(DisposisiC());

   final globalC = Get.find<Global>();

  @override
   Widget build(BuildContext context) {
    int y=0;
    return Scaffold(
      appBar: AppBar(
         title: Text("Disposisi"),
         backgroundColor: Color(0xFF1A237E),
        actions: [
          PopupMenuButton<String>(
              onSelected: (String e){
                disposisiC.filter.value = e;
              },
              itemBuilder: (context){
                return disposisiC.bulan.map((String bulan) {
                  return PopupMenuItem<String>(
                      value: bulan,
                      child: Text(bulan)
                  );
                }).toList();
              }
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: disposisiC.getAllDisposisi(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else{
                return Obx((){
                  return ListView.builder(
                    itemCount: globalC.disposisi.value.data!.length,
                    itemBuilder: (context, index){
                      return Obx((){
                        return disposisiC.filter.value == "Hapus"
                            ? Card(
                                elevation: 6,
                                margin: EdgeInsets.all(Get.height * 0.00612745098),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Text("${globalC.disposisi.value.data![index].id}"),
                                    backgroundColor: Colors.amber,
                                  ),
                                  title: Text("${globalC.disposisi.value.data![index].perihal}"),
                                  subtitle: Text("Tujuan : ${globalC.disposisi.value.data![index].kepada}"),
                                  trailing: globalC.disposisi.value.data![index].status == "Selesai"
                                      ? Card(
                                    color: Colors.green,
                                    child:
                                    Padding(padding: EdgeInsets.fromLTRB(Get.height * 0.01838235294, Get.height * 0.00490196078, Get.height * 0.01838235294, Get.height * 0.00490196078),
                                      child: Text("${globalC.disposisi.value.data![index].status}",
                                        style: TextStyle (
                                            color: Colors.white,
                                            fontSize: 13
                                        ),
                                      ),
                                    ),
                                  )
                                      : Card(
                                    color: Colors.orange,
                                    child:
                                    Padding(padding: EdgeInsets.fromLTRB(Get.height * 0.01838235294, Get.height * 0.00490196078, Get.height * 0.01838235294, Get.height * 0.00490196078),
                                      child: Text("${globalC.disposisi.value.data![index].status}",
                                        style: TextStyle (
                                            color: Colors.black,
                                            fontSize: 13
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    Get.to(() => DetailDisposisi(), arguments: globalC.disposisi.value.data![index].noSurat);
                                  },
                                ),
                              )
                            : disposisiC.filter.value == DateFormat("MMMM","id_ID").format(globalC.disposisi.value.data![index].tglDiterima!)
                              ? Card(
                                  elevation: 6,
                                  margin: EdgeInsets.all(Get.height * 0.00612745098),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text("${globalC.disposisi.value.data![index].id}"),
                                      backgroundColor: Colors.amber,
                                    ),
                                    title: Text("${globalC.disposisi.value.data![index].perihal}"),
                                    subtitle: Text("Tujuan : ${globalC.disposisi.value.data![index].kepada}"),
                                    trailing: globalC.disposisi.value.data![index].status == "Selesai"
                                        ? Card(
                                      color: Colors.green,
                                      child:
                                      Padding(padding: EdgeInsets.fromLTRB(Get.height * 0.01838235294, Get.height * 0.00490196078, Get.height * 0.01838235294, Get.height * 0.00490196078),
                                        child: Text("${globalC.disposisi.value.data![index].status}",
                                          style: TextStyle (
                                              color: Colors.white,
                                              fontSize: 13
                                          ),
                                        ),
                                      ),
                                    )
                                        : Card(
                                      color: Colors.orange,
                                      child:
                                      Padding(padding: EdgeInsets.fromLTRB(Get.height * 0.01838235294, Get.height * 0.00490196078, Get.height * 0.01838235294, Get.height * 0.00490196078),
                                        child: Text("${globalC.disposisi.value.data![index].status}",
                                          style: TextStyle (
                                              color: Colors.black,
                                              fontSize: 13
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Get.to(() => DetailDisposisi(), arguments: globalC.disposisi.value.data![index].noSurat);
                                    },
                                  ),
                                )
                              : SizedBox(height: 0,);
                      });
                    },
                  );
                });
              }
            }
        ),
      )
    );
  }
}