import 'package:app/data/tasca.dart';
import 'package:hive/hive.dart';

class RepositoriTasca {

  static const String clauLlistaTasques = 'LlistaTasques';
  static const String nomBoxTasques = 'BoxTasques_app_tasques';

  //Metodo Get

  Box<List<dynamic>> _getBox() {
    return Hive.box<List<dynamic>>(nomBoxTasques);
  } 

  //Metode Set
  Future<void> setBox(List<dynamic> LlistaTasques)async{

// Per operacions que tenen un temps d'espera, perque
// poden trigar,(com accedir a arxius) es fa servir async i await
// En aquest casos, el tipus de dades de retorn, ha de ser Futuer<TipusDada> 

    await _getBox().put(clauLlistaTasques, LlistaTasques);

  }

  List<dynamic> getLlistaTasques(){
    //Retorna la llista de tasques
    // La box de tasques, ens es retornada amb el metode _getBox()
    //Amb aquest box que ens retorna, fem servier el metode get() de les box,
    //per obtenir la llista tasques
    return _getBox().get(
      clauLlistaTasques, 
    defaultValue: <Tasca>[Tasca(titol: "Tasca d'exemple")] //Si no hi ha res, retorna una tasca d'exemple
    )!;
  }

    Future<void> afegirTasca(Tasca tascaPerAfegir)async{
    
      final List<dynamic> LlistaTasques = getLlistaTasques();
      LlistaTasques.add(tascaPerAfegir);

      await setBox(LlistaTasques);
  }

  Future <void> esborraTasca(int index) async {
    
    final List<dynamic> LlistaTasques = getLlistaTasques();

    LlistaTasques.removeAt(index);

    await setBox(LlistaTasques);

  }

  Future<void> actualitzaTasca(int index, Tasca tascaActualitzada) async {

    print("Actualitzant tasca a l'index $index, valor completada: ${tascaActualitzada.completada}" );

    final List<dynamic> LlistaTasques = getLlistaTasques();

    LlistaTasques[index] = tascaActualitzada;

    await setBox(LlistaTasques);

  }

}