import 'package:app/colors_app.dart';
import 'package:app/components/boton_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  const DialogNovaTasca({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(

      title: Text("Quina nova tasca vols afegir?",
      style: TextStyle(color: ColorsApp.colorPrimari),
      ),

      content: Container(
        child: Column(
          children: [
            TextField(),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotonDialog( 
                  textBoto: "Guardar", 
                  colorBoto: ColorsApp.colorTerciari,
                  iconBoto: Icons.save,
                  accioBoto: (){
                    guardarTasca(context);
                    },
                  ),
                  
                  
                BotonDialog( 
                  textBoto: "Tancar", 
                  colorBoto: ColorsApp.colorRosa,
                  iconBoto: Icons.close,
                  accioBoto: (){
                    tancarDialog(context);
                    },
                  ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  void guardarTasca(BuildContext context){
    Navigator.of(context).pop();
  }
  void tancarDialog(BuildContext context){
    Navigator.of(context).pop();
  }
}