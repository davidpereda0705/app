// repositori_contacte.dart
import 'package:app/data/contacte.dart';
import 'package:hive/hive.dart';

class RepositoriContacte {

  static const String clauLlistaContactes = 'LlistaContactes';
  static const String nomBoxContactes = 'BoxContactes_app_contactes';

  // Método Get para la box
  Box<List<dynamic>> _getBox() {
    return Hive.box<List<dynamic>>(nomBoxContactes);
  } 

  // Método Set
  Future<void> setBox(List<dynamic> LlistaContactes) async {
    await _getBox().put(clauLlistaContactes, LlistaContactes);
  }

  List<dynamic> getLlistaContactes() {
    // Retorna la llista de contactos
    // Si no hay nada, retorna una lista vacía (no datos de ejemplo por defecto)
    return _getBox().get(
      clauLlistaContactes, 
      defaultValue: <Contacte>[] // Lista vacía por defecto
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

  // Método opcional para inicializar con datos de prueba (similar a lo que tenías)
  Future<void> inicialitzarAmbDadesProva() async {
    final llistaActual = getLlistaContactes();
    
    if (llistaActual.isEmpty) {
      final contactesProva = [
        Contacte(nom: 'Joan Martínez', telefon: '612345678', email: 'joan@exemple.cat'),
        Contacte(nom: 'Maria García', telefon: '623456789', email: 'maria@exemple.cat'),
        Contacte(nom: 'Pere López', telefon: '634567890', email: 'pere@exemple.cat'),
        Contacte(nom: 'Anna Rodríguez', telefon: '645678901', email: 'anna@exemple.cat'),
      ];
      
      await setBox(contactesProva);
    }
  }
}