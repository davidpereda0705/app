import 'package:app/colors_app.dart';
import 'package:flutter/material.dart';

class TextfieldPersonalitzat extends StatelessWidget {
  final TextEditingController controllerTitol;
  final String hintText;
  final IconData? iconPrefix;
  final TextInputType? keyboardType;

   const TextfieldPersonalitzat({
    super.key,
    required this.controllerTitol,
    this.hintText = "Introdueix la teva tasca",
    this.iconPrefix,
    this.keyboardType,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerTitol,
      cursorColor: ColorsApp.colorPrimari,
      cursorWidth: 2,
      keyboardType: keyboardType ?? TextInputType.text,
      
      style: TextStyle(
        color: ColorsApp.colorPrimari,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        ),

        decoration: InputDecoration(
          hint: Row(
            children: [
              Icon(
                iconPrefix ?? Icons.edit, 
                color: ColorsApp.colorPrimari,
              ),
              SizedBox(width: 8),
              Text(
                hintText,
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