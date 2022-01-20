import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/surat_masuk/SuratMasuk.dart' as SM;
import 'surat_masuk/suratMasuk.dart';
import 'surat_keluar/suratKeluar.dart';
import 'panduan/panduan.dart';
import 'disposisi/disposisi.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final globalC = Get.find<Global>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; 
    return Scaffold( 
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: Color(0xFFE8EAF6),
            ),
          ),
           Container(
            height: size.height * .50,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.indigo[900]!, Colors.blue[700]!]
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02450980392, vertical: Get.height * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(
                    "Hello, ${globalC.user.value.data!.username}",
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w900),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Get.height * 0.0306372549 , bottom: Get.height * 0.02450980392),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical:15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo[50],
                    ),
                    child: 
                      Text(
                        "E-Surat Polsek merupakan aplikasi untuk memudahkan Polsek Sukodadi dalam pendataan surat dan administrasi secara digital.",
                        style: TextStyle(color: Colors.blueGrey[800], fontSize: 15.0, fontWeight: FontWeight.w400),
                      ),
                      
                   
                  ),
                   Expanded(
                      child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Surat Masuk",
                          pngSrc: "asset/icons/inbox.png",
                          press: () {
                            Get.to(() => SM.SuratMasuk());
                          },
                        ),
                        CategoryCard(
                          title: "Disposisi",
                          pngSrc: "asset/icons/disposisi.png",
                          press: () {
                            globalC.user.value.data!.role != "Satuan Kerja"
                                ? Get.to(() => Disposisi())
                                : Get.defaultDialog(title: "Error", middleText: "Hanya bisa diakses oleh Jabatan Tertentu");
                          },
                        ),
                        CategoryCard(
                          title: "Surat Keluar",
                          pngSrc: "asset/icons/outbox.png",
                          press: () {
                            globalC.user.value.data!.role != "Satuan Kerja"
                                ? Get.to(() => SuratKeluar())
                                : Get.defaultDialog(title: "Error", middleText: "Hanya bisa diakses oleh Jabatan Tertentu");
                          },
                        ),
                         CategoryCard(
                          title: "Panduan",
                          pngSrc: "asset/icons/guide.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return (Panduan());
                              }),
                            );
                          },
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}
class CategoryCard extends StatelessWidget {
  final String pngSrc;
  final String title;
  final void Function() press;
  const CategoryCard({
    Key? key,
    required this.pngSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: EdgeInsets.all(Get.height * 0.02450980392),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
         
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: EdgeInsets.all(Get.height * 0.02450980392),
              child: Column(
                children: <Widget>[
                  Spacer(),
                    Image.asset(pngSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}