import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/surat_keluar/SuratKeluarC.dart';
import 'detail_surat_keluar.dart';

class SuratKeluar extends StatelessWidget {

  final suratKeluarC = Get.put(SuratKeluarC());

  final globalC = Get.find<Global>();

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Surat Keluar"),
         backgroundColor: Color(0xFF1A237E),
         actions: [
           PopupMenuButton<String>(
                onSelected: (String e){
                  suratKeluarC.filter.value = e;
                },
               itemBuilder: (context){
                  return suratKeluarC.bulan.map((String bulan) {
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
            future: suratKeluarC.getSuratKeluar(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else{
                return Obx((){
                  return ListView.builder(
                    itemCount: globalC.suratKeluar.value.data!.length,
                    itemBuilder: (context, index){
                      var data = globalC.suratKeluar.value.data![index];
                      return Obx((){
                        return suratKeluarC.filter.value == "Hapus"
                            ? Card(
                          elevation: 6,
                          margin: EdgeInsets.all(Get.height * 0.00612745098),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text("${data.id}"),
                              backgroundColor: Colors.amber,
                            ),
                            title: Text("${data.perihal}"),
                            subtitle: Text("Tujuan : ${data.kepada}"),
                            trailing: data.status == "Selesai"
                                ? Card(
                              color: Colors.green,
                              child:
                              Padding(padding: EdgeInsets.fromLTRB(Get.height * 0.01838235294, Get.height * 0.00490196078, Get.height * 0.01838235294, Get.height * 0.00490196078),
                                child: Text("${data.status}",
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
                                child: Text("${data.status}",
                                  style: TextStyle (
                                      color: Colors.black,
                                      fontSize: 13
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Get.to(() => DetailSuratKeluar(), arguments: [data.id, data.status]);
                            },
                          ),
                        )
                            : suratKeluarC.filter.value == DateFormat("MMMM","id_ID").format(data.tgl!)
                            ? Card(
                          elevation: 6,
                          margin: EdgeInsets.all(Get.height * 0.00612745098),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text("${data.id}"),
                              backgroundColor: Colors.amber,
                            ),
                            title: Text("${data.perihal}"),
                            subtitle: Text("Tujuan : ${data.kepada}"),
                            trailing: data.status == "Selesai"
                                ? Card(
                              color: Colors.green,
                              child:
                              Padding(padding: EdgeInsets.fromLTRB(Get.height * 0.01838235294, Get.height * 0.00490196078, Get.height * 0.01838235294, Get.height * 0.00490196078),
                                child: Text("${data.status}",
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
                                child: Text("${data.status}",
                                  style: TextStyle (
                                      color: Colors.black,
                                      fontSize: 13
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Get.to(() => DetailSuratKeluar(), arguments: [data.id, data.status]);
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