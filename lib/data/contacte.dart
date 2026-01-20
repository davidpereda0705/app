// lib/data/contacte.dart

import 'package:hive/hive.dart';
part 'contacte.g.dart';  



// Usamos typeId: 1 (Tasca usa 0)
@HiveType(typeId: 1)
class Contacte extends HiveObject {
  
  @HiveField(0)
  String nom;
  
  @HiveField(1)
  String telefon;
  
  @HiveField(2)
  String email;
  
  Contacte({
    required this.nom,
    required this.telefon,
    required this.email,
  });

  // Método para convertir a String (útil para debugging)
  @override
  String toString() {
    return 'Contacte{nom: $nom, telefon: $telefon, email: $email}';
  }
}