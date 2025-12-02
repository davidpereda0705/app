import 'package:app/colors_app.dart';
import 'package:flutter/material.dart';

class TextfieldPersonalitzat extends StatelessWidget {
  const TextfieldPersonalitzat({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorsApp.colorPrimari,
      cursorWidth: 2,
      
      style: TextStyle(
        color: ColorsApp.colorPrimari,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        ),

        decoration: InputDecoration(
          hint: Row(
            children: [
              Icon(Icons.edit, color: ColorsApp.colorPrimari,),
              Text(
                "Introdueix la teva tasca",
                style: TextStyle(
                  color: ColorsApp.colorPrimari,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  ),
                ),
            ],
          ),
            filled: true,
            fillColor: ColorsApp.colorSecundariAccent,

            //Aspecte de la bora quan el TextField esta habilitat
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorsApp.colorPrimari,
                width: 2,
                ),
              ),
              //Aspecte de la bora quan el Textfield esta en focus (escritura)
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsApp.colorPrimari,
                  width: 3,
                  ),
              ),
        ),
    );
  }
}