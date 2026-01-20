// item_contacte.dart
import 'package:app/colors_app.dart';
import 'package:app/data/repositori_contacte.dart';
import 'package:app/data/contacte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemContacte extends StatefulWidget {
  final String nom;
  final String email;
  final int indexContacte;

  const ItemContacte({
    super.key, 
    required this.nom,
    required this.email,
    required this.indexContacte,
  });

  @override
  State<ItemContacte> createState() => _ItemContacteState();
}

class _ItemContacteState extends State<ItemContacte> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(), 
        children: [
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: ColorsApp.colorPrimariAccent,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {
              _mostrarMensajeTemporal(context, 'Editar ${widget.nom}');
            },
          ),
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: ColorsApp.colorPrimariAccent,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {
              RepositoriContacte repositoriContacte = RepositoriContacte();
              repositoriContacte.esborraContacte(widget.indexContacte);
              _mostrarMensajeTemporal(context, 'Eliminat ${widget.nom}');
            },
          ),
        ]
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsApp.colorTerciari,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Nombre y email (simple, igual que ItemTasca)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre (igual que el texto de tarea en ItemTasca)
                  Text(
                    widget.nom,
                    style: TextStyle(
                      color: ColorsApp.colorBlanc,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Email (texto secundario)
                  Text(
                    widget.email,
                    style: TextStyle(
                      color: ColorsApp.colorBlanc.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarMensajeTemporal(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: ColorsApp.colorSecundari,
        duration: Duration(seconds: 1),
      ),
    );
  }
}