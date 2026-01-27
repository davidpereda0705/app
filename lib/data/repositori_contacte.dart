// repositori_contacte.dart
import 'package:app/data/contacte.dart';
import 'package:hive/hive.dart';

class RepositoriContacte {

  static const String clauLlistaContactes = 'LlistaContactes';
  static const String nomBoxContactes = 'BoxContactes_app_contactes';

  Box<List<dynamic>> _getBox() {
    return Hive.box<List<dynamic>>(nomBoxContactes);
  } 

  Future<void> setBox(List<dynamic> LlistaContactes) async {
    await _getBox().put(clauLlistaContactes, LlistaContactes);
  }

  List<dynamic> getLlistaContactes() {
    return _getBox().get(
      clauLlistaContactes, 
      defaultValue: <Contacte>[]
    )!;
  }

  Future<void> afegirContacte(Contacte contactePerAfegir) async {
    final List<dynamic> LlistaContactes = getLlistaContactes();
    LlistaContactes.add(contactePerAfegir);
    await setBox(LlistaContactes);
  }

  Future<void> esborraContacte(int index) async {
    final List<dynamic> LlistaContactes = getLlistaContactes();
    LlistaContactes.removeAt(index);
    await setBox(LlistaContactes);
  }

  Future<void> actualitzaContacte(int index, Contacte contacteActualitzat) async {
    final List<dynamic> LlistaContactes = getLlistaContactes();
    LlistaContactes[index] = contacteActualitzat;
    await setBox(LlistaContactes);
  }

  // Método para inicializar con datos de prueba
  Future<void> inicialitzarAmbDadesProva() async {
    final llistaActual = getLlistaContactes();
    
    if (llistaActual.isEmpty) {
      final contactesProva = [
        Contacte(
          nom: 'Exemple', 
          email: 'exemple@exemple.cat',
          contrasenya: '1234'  
        ),
      ];
      
      await setBox(contactesProva);
    }
  }
}