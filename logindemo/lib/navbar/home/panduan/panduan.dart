import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/panduan/guide.dart';
import 'detail_panduan.dart';

void main() => runApp(new Panduan());

class Panduan extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
   return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panduan',
      theme: ThemeData(
          primaryColor: Color(0xFF1A237E)),
      home: ListPanduan(),
    );
  }
}

class ListPanduan extends StatelessWidget {
  final globalC = Get.find<Global>();

  List guides = getGuides();

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Guide guide) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: Get.height * 0.02450980392, vertical: Get.height * 0.01225490196),
          title: Text(
            guide.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
         
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPanduan(guide: guide)));
          },
        );

    Card makeCard(Guide guide) => Card(
          elevation: 8.0,
          margin: EdgeInsets.symmetric(horizontal: Get.height * 0.01225490196, vertical: Get.height * 0.00735294117),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: makeListTile(guide),
          ),
        );

    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xFF1A237E),
        title: Text("Panduan Aplikasi"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: globalC.user.value.data!.role == "Satuan Kerja" ? 1 : guides.length,
          itemBuilder: (BuildContext context, int index) {
            return globalC.user.value.data!.role == "Satuan Kerja"
                ? makeCard(
                Guide(
                    title: "Panduan Surat Masuk",
                    content:
                    "Menu Surat Masuk berisikan daftar surat yang diterima oleh POLSEK Sukodadi dan diteruskan kepada user sesuai dengan arahan KAPOLSEK. Untuk melihat detail surat masuk klik Menu surat masuk pada halaman utama kemudian akan ditampilkan list yang berisi judul surat dan nama pengirim, selanjutnya klik surat yang akan dipilih maka aplikasi akan menampilkan detail surat tersebut.")
                  )
                : makeCard(guides[index]);
          },
        ),
      ),
    );
  }
}

List getGuides() {
  return [
    Guide(
        title: "Panduan Surat Masuk",
        content:
            "Menu Surat Masuk berisikan daftar surat yang diterima oleh POLSEK Sukodadi. Untuk melihat detail surat masuk klik Menu surat masuk pada halaman utama kemudian akan ditampilkan list yang berisi judul surat dan nama pengirim, selanjutnya klik surat yang akan dipilih maka aplikasi akan menampilkan detail surat tersebut"),
    Guide(
        title: "Panduan Surat Keluar",
        content:
            "Menu Surat Keluar berisikan daftar surat keluar yang akan ditinjau oleh KAPOLSEK Sukodadi. Untuk melihat detail surat keluar klik Menu surat keluar pada halaman utama kemudian akan ditampilkan list yang berisi judul surat dan penerima, selanjutnya klik surat yang akan dipilih maka aplikasi akan menampilkan detail surat tersebut."),
     Guide(
        title: "Disposisi",
        content:
            "Menu Disposisi berisikan daftar disposisi surat masuk yang sudah dibuat oleh KAPOLSEK Sukodadi. Untuk melihat detail diposisi klik Menu disposisi pada halaman utama kemudian akan ditampilkan list yang berisi judul surat dan pengirim, selanjutnya klik surat yang akan dipilih maka aplikasi akan menampilkan detail surat tersebut."),
  ];
}

