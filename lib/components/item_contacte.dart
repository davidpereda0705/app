
import 'package:app/colors_app.dart';
import 'package:flutter/material.dart';

class ItemContacte extends StatelessWidget {
  final String nom;
  final String telefon;
  final String email;
  final int? indexContacte;
  final VoidCallback? onEliminar;
  final VoidCallback? onEditar;
  
  const ItemContacte({
    super.key,
    required this.nom,
    required this.telefon,
    required this.email,
    this.indexContacte,
    this.onEliminar,
    this.onEditar,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: ColorsApp.colorPrimari.withOpacity(0.9),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: ColorsApp.colorSecundari,
          child: Text(
            nom.isNotEmpty ? nom[0].toUpperCase() : '?',
            style: TextStyle(
              color: ColorsApp.colorBlanc,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          nom,
          style: TextStyle(
            color: ColorsApp.colorBlanc,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.phone, size: 14, color: ColorsApp.colorSecundariAccent),
                SizedBox(width: 8),
                Text(
                  telefon,
                  style: TextStyle(color: ColorsApp.colorBlanc.withOpacity(0.8)),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.email, size: 14, color: ColorsApp.colorSecundariAccent),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    email,
                    style: TextStyle(color: ColorsApp.colorBlanc.withOpacity(0.8)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onEditar != null)
              IconButton(
                onPressed: onEditar,
                icon: Icon(Icons.edit, color: ColorsApp.colorSecundariAccent),
              ),
            if (onEliminar != null)
              IconButton(
                onPressed: onEliminar,
                icon: Icon(Icons.delete, color: Colors.red[300]),
              ),
          ],
        ),
      ),
    );
  }
}