import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/notifTab/widget/notifikasiC.dart';

class Notifikasi extends StatelessWidget{

  final notifC = Get.put(NotifikasiC());
  final globalC = Get.find<Global>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Notifikasi"),
         backgroundColor: Color(0xFF1A237E),
           bottom: TabBar(
             controller: notifC.controller,
             tabs: <Widget>[
              Tab(icon: Icon(Icons.mail_outline),text: "Surat Masuk",),
              Tab(icon: Icon(Icons.arrow_upward),text: "Surat Keluar",),
             ],
           ),
      ),
      body: FutureBuilder(
          future: notifC.getNotif(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              return TabBarView(
                controller: notifC.controller,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(Get.height * 0.01225490196, Get.height * 0.01225490196, Get.height * 0.01225490196, Get.height * 0.01225490196),
                    child: globalC.notifikasi.value.suratMasuk!.data!.isEmpty || globalC.notifikasi.value.suratMasuk!.data! == null
                        ? Center(
                      child: Text("Tidak ada notifikasi", style: TextStyle(fontSize: 16),),
                    )
                        : ListView.builder(
                      itemBuilder: (context, index){
                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(Get.height * 0.03676470588, Get.height * 0.01838235294, Get.height * 0.01715686274, Get.height * 0.01225490196),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("${globalC.notifikasi.value.suratMasuk!.data![index].perihal}",
                                      style: TextStyle (
                                          color: Colors.black,
                                          fontSize: 16
                                      ),
                                    ),
                                    Text("${globalC.notifikasi.value.suratMasuk!.data![index].pengirim}",
                                      style: TextStyle (
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontStyle: FontStyle.italic
                                      ),
                                    ),
                                    Text("${globalC.notifikasi.value.suratMasuk!.data![index].status}",
                                      style: TextStyle (
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: globalC.notifikasi.value.suratMasuk!.data! == null ? 0 : globalC.notifikasi.value.suratMasuk!.data!.length,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(Get.height * 0.01225490196, Get.height * 0.01225490196, Get.height * 0.01225490196, Get.height * 0.01225490196),
                    child: globalC.notifikasi.value.suratKeluar!.data!.isEmpty || globalC.notifikasi.value.suratKeluar!.data! == null
                        ? Center(
                            child: Text("Tidak ada notifikasi", style: TextStyle(fontSize: 16),),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index){
                              return Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(Get.height * 0.03676470588, Get.height * 0.01838235294, Get.height * 0.01715686274, Get.height * 0.01225490196),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("${globalC.notifikasi.value.suratKeluar!.data![index].perihal}",
                                            style: TextStyle (
                                                color: Colors.black,
                                                fontSize: 16
                                            ),
                                          ),
                                          Text("${globalC.notifikasi.value.suratKeluar!.data![index].kepada}",
                                            style: TextStyle (
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontStyle: FontStyle.italic
                                            ),
                                          ),
                                          Text("${globalC.notifikasi.value.suratKeluar!.data![index].status}",
                                            style: TextStyle (
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: globalC.notifikasi.value.suratKeluar!.data! == null ? 0 : globalC.notifikasi.value.suratKeluar!.data!.length,
                          )
                  )
                ],
              );
            }
          }
      ),
    );
  }
}