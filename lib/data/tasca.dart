

import 'package:hive/hive.dart';

part 'tasca.g.dart';

/*
flutter pub add <nom_dependencia>
Fem servir la BD Hive 
Hive es una base de dades NoSQL.

Per a cada tipus d'objecte que volem guardar a la BD,
hem de crear una classe que hereti de HiveObject

Instal lar les dependencies de desenvolupament (dev_dependencies)
  hive_generator
  build_runner

 Flutter pub add --dev hlive_generator
Flutter pub add --dev build_runner

Després d'haver creat aquesta classe, 
hem de generar els fitxers .dart corresponents, 
per a la serialització 
(conversió de l'objecte a dades que es poden guardar a la BD, 
i viceversa).

Després, escriu part tasca.g.dart;
i executa a la terminal:


flutter pub run build_runner build
(cal haver parat l'execució de l'app si està en marxa).

Això ens generarà l'arxiu tasca.g.dart automàticament.

El nom de l'arxiu tasca.dart, 
ha de ser igual que el nom de la classe en minuscules

Si la classe canvia, per exemple, s'afegeix un nou atribut,
cal tornar a executar la comanda de build_runner per actualitzar
l'arxiu tasca.g.dart

*/

@HiveType(typeId: 0) //Pot anar de 0 a 255.
class Tasca extends HiveObject{

@HiveField(0)
String titol;
@HiveField(1)
bool completada;

Tasca({
  required this.titol, 
this.completada = false //Es creen amb el checkbox no marcat
});

}