import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en' : {
      // 'title' : 'Hello %s dari %s',
      'title' : 'Hello @name dari @things',
      'body' : 'You have pushed the button this many times:',
    },
    'id' : {
      'title' : 'Halaman Utama',
      'body' : 'Kamu telah menekan tombol ini sebanyak :',
    },
    'id_BT' : {
      'title' : 'Belah Depan',
      'body' : 'Elu udeh neken ni tombol :',
    },
  };
}