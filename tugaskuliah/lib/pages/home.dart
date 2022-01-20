import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugaskuliah/controllers/barangC.dart';
import 'package:tugaskuliah/model/barang.dart';
import 'package:tugaskuliah/pages/SMSCenter.dart';
import 'package:tugaskuliah/pages/call_center.dart';
import 'package:tugaskuliah/pages/detail.dart';
import 'package:tugaskuliah/pages/location.dart';
import 'package:tugaskuliah/pages/update.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget{
  final VoidCallback signOut;

  const HomePage({Key? key, required this.signOut}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final money = NumberFormat("#,##0","en_US");

  final barangC = Get.put(BarangController());

  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  String username = "";
  String password = "";
  String nama = "";
  String id = "";

  getPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username")!;
      password = preferences.getString("password")!;
      nama = preferences.getString("nama")!;
      id = preferences.getString("id")!;
    });
  }

  telp()async{
    await call('+62822642');
  }

  sms()async{
    await sendSMS('+6234234435');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
              itemBuilder: (context)=>[
              PopupMenuItem<int>(child: Text("Call Center"),value: 0,),
              PopupMenuItem<int>(child: Text("SMS Center"),value: 1,),
              PopupMenuItem<int>(child: Text("Location"),value: 2,),
              PopupMenuItem<int>(child: Text("Update Username dan Password "),value: 3,),
              PopupMenuDivider(),
              PopupMenuItem<int>(child: Text("Log Out "),value: 4,),
              ],
              onSelected: (item) => SelectedItem(context, item),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                  itemCount: barang.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemBuilder: (context,index){
                    final x = barang[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 120,
                              child: Image.network(x.gambar,fit: BoxFit.cover,),
                            ),
                            onTap: (){
                              barangC.total.value += x.harga;
                            },
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return DetailPage(barang: x,money: money,);
                              }));
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 4,),
                                  Text(x.nama,style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 16)),),
                                  SizedBox(height: 4,),
                                  Text("Rp " + money.format(x.harga),style: GoogleFonts.lato(textStyle: TextStyle(fontSize:16)),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),
          )
      ),
      bottomNavigationBar: Obx((){
        return GestureDetector(
          child: Text(
            "Total : Rp " + money.format(barangC.total.value),
            style: GoogleFonts.lato(textStyle: TextStyle(fontSize:25),),
            textAlign: TextAlign.center,
          ),
          onTap: (){
            Get.bottomSheet(
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    color: Colors.white,
                    child: Center(
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Transaksi : ",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
                              Text("Rp " + money.format(barangC.total.value),style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
                            ],
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: barangC.bayar,
                            decoration: InputDecoration(
                                border: OutlineInputBorder()
                            ),
                            onChanged: (nilai){
                              barangC.kembalian.value = int.parse(barangC.bayar.text) - barangC.total.value;
                            },
                            // onEditingComplete: (){
                            //   barangC.kembalian.value = int.parse(barangC.bayar.text) - barangC.total.value;
                            // },
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Kembalian : ",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
                              Obx((){
                                return Text("Rp " + money.format(barangC.kembalian.value),style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20)));
                              })
                            ],
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(onPressed: (){
                            if(barangC.kembalian.value >= 0){
                              barangC.total.value = 0;
                              barangC.kembalian.value = 0;
                              barangC.bayar.text = '';
                              Get.back();
                            }else{
                              Get.snackbar(
                                  "ERROR",
                                  "Uang Anda Kurang",
                                  backgroundColor: Colors.white
                              );
                            }
                          }, child: Text("BAYAR"))
                        ],
                      ),
                    ),
                  ),
                )
            );
          },
        );
      }),
    );
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        telp();
        break;
      case 1:
        sms();
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LocationPage()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Update(signOut: signOut,)));
        break;
      case 4:
        signOut();
        break;
    }
  }

  Future<void> call(String phoneNumber)async{
    await launch('tel:$phoneNumber');
  }

  Future<void> sendSMS(String phoneNumber)async{
    await launch('sms:$phoneNumber');
  }
}