import 'package:app/colors_app.dart';
import 'package:flutter/material.dart';

class BotonDialog extends StatelessWidget {
  final String textBoto;
  final IconData iconBoto;
  final Color colorBoto;
  //volem que els botons facin coses diferents quan es premin
  final Function()? accioBoto;
  //Function(): tipus de dada que representa una funció que no rep cap paràmetre i no retorna res.
  //Function()? : pot ser null (no fer res quan es prem el botó)
  const BotonDialog({super.key, 
  required this.textBoto, 
  required this.iconBoto, 
  required this.colorBoto,
  required this.accioBoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: accioBoto,
      child: Container(
      
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorBoto,
        ),
        child: Row(
      
          children: [
      
            Icon(iconBoto, color: ColorsApp.colorBlanc,),
      
            SizedBox(width: 8,),
      
            Text(textBoto, style: TextStyle(
              color: ColorsApp.colorBlanc,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              ),),
          ],
          ),
      ),
    );
  }
}