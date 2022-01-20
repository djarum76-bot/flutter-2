import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:set_state/module_tile.dart';
import 'package:set_state/provider/done_module_provider.dart';

class ModuleList extends StatelessWidget {
  final List<String> _moduleList = [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Memulai Pemrograman dengan Dart',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _moduleList.length,
        itemBuilder: (context, index){
          return Consumer<DoneModuleProvider>(
              builder: (context, DoneModuleProvider data, widget){
                return ModuleTile(
                    moduleName: _moduleList[index],
                    isDone: data.doneModuleList.contains(_moduleList[index]),
                    onClick: (){
                      data.complete(_moduleList[index]);
                    }
                );
              });
        }
    );
  }
}