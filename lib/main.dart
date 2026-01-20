import 'package:app/data/contacte.dart';
import 'package:app/data/repositori_contacte.dart';
import 'package:app/data/repositori_tasca.dart';
import 'package:app/data/tasca.dart';
import 'package:app/paginas/paginaprincipal/pantalla_tasques_gran.dart';
import 'package:app/paginas/paginaprincipal/pantalla_tasques_mitjana.dart';
import 'package:app/paginas/paginaprincipal/pantalla_tasques_petita.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async{

  //flutter pub add <nom_dependencies>

  //Per provar Hive en web, cal obrir-ho sempre amb el mateix port
  // (es igual quin, pero el mateix). Los dades de Hive es guarden
  //en una carpeta temporal del navegador, i si es canvia de port,
  //es considera un altre lloc, i no es troben les dades.

  //Per obrir (executar) l'aplicacio en web un port concret,
  // s'utilitza la seguent comanda a la terminal:
  // flutter run -d chrome --web-port 58062 

  //Incialitzar Hive
  WidgetsFlutterBinding.ensureInitialized();
  //El metodo per inicialitzar Hive, es crida amb await
  //Aixo fa que el metode main sigui async
  //I el tipus de retorn sigui Future<void>
  // Al fer servir metodes amb await, abans, fer el .ensureInitialized()  
  
  await Hive.initFlutter();

  //Fem que faci servir l'adaptador de la classe Tasca (arxiu tasca.g.dart)
  Hive.registerAdapter(TascaAdapter());
   Hive.registerAdapter(ContacteAdapter());

  //Obrim una box de Hive per a guardar la llista de tasques
  await Hive.openBox<List<dynamic>>(RepositoriTasca.nomBoxTasques);
  await Hive.openBox<List<dynamic>>(RepositoriContacte.nomBoxContactes);
  
  //Si tenim mes boxs, hauriem de fer el mateix per a cadascuna
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


  Dependencies:
  ============================
  S'afegeixen a l'arxiu pubspec.yaml, dins de "dependencies:"
  En una terminal fem: flutter pub add <nom_dependencia>
  Instalem: flutter_slidable, hive, hive_flutter
  Si,per exemple, en el hive_flutter, ens dona error i diu
   que necessitem habilitar scripts en l'ordinador, o ens diu
   que hem d'habilitar el mode desarrollador (developer) l' habilitem

  Es poden consultar dependencies disponibles a: https://pub.dev/
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
