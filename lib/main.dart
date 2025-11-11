import 'package:app/paginas/paginaprincipal/pantalla_tasques_gran.dart';
import 'package:app/paginas/paginaprincipal/pantalla_tasques_mitjana.dart';
import 'package:app/paginas/paginaprincipal/pantalla_tasques_petita.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
 El que volem: volem carregar tres pantalles diferents,
 segons la mida de la pantalla del dispositiu.
  - Pantalla petita: mobil (amplada < 600px)
    - Pantalla gran: escriptori (amplada >= 1200px)
  - Pantalla mitjana: tablet (600 <= amplada < 1200px)

  MediaQuery.of(context).size.width ens dona l'amplada.

  If ternari: condicio ? valor_si_cert : valor_si_fals

  Saber mides pantalla:
  ============================
  MediaQuery.of(context).size.width ens dona l'amplada.

  Saber orientacion dispositiu:
  ============================
  MediaQuery.of(context).orientation
    - Ens diu Orientation.portrait (mobil vertical) o Orientation.landscape (mobil horitzontal),


  Saber tipus de dispositiu:
  ============================
  kIsweb: true si es web, false si es mobil/escriptori
  Platform.isAndroid / Platform.isIOS / Platform.isWindows / Platform.isMacOS / Platform.isLinux

 */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dispositiuWeb = kIsWeb; //Amb la bombeta demana un import del package de foundation.dart
    print( 'Dispositiu web: $dispositiuWeb');

    print(MediaQuery.of(context).size.width);
    final tamano = MediaQuery.of(context).size.width < 600
          ? PantallaTasquesPetita()
          : MediaQuery.of(context).size.width < 1200
              ? PantallaTasquesMitjana()
              : PantallaTasquesGran();
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: tamano,         
    );
  }
}
