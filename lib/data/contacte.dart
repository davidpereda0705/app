// contacte.dart

import 'package:hive/hive.dart';
part 'contacte.g.dart';



@HiveType(typeId: 1)
class Contacte extends HiveObject {
  
  @HiveField(0)
  String nom;
  
  @HiveField(1)
  String email;
  
  @HiveField(2)  // Este campo existe pero no se muestra
  String contrasenya;
  
  Contacte({
    required this.nom,
    required this.email,
    required this.contrasenya,
  });

  @override
  String toString() {
    return 'Contacte{nom: $nom, email: $email}';  // No mostrar contraseña
  }
}