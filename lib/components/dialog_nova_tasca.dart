import 'package:app/colors_app.dart';
import 'package:app/components/boton_dialog.dart';
import 'package:app/components/textfield_personalitzat.dart';
import 'package:app/data/repositori_tasca.dart';
import 'package:app/data/tasca.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {

  final String textTasca;
  final int indexTasca;
  const DialogNovaTasca({
    super.key,
    this.textTasca = "",
    this.indexTasca = -1,

    });

  @override
  Widget build(BuildContext context){

    final TextEditingController controllerTextTasca = TextEditingController();
    controllerTextTasca.text = textTasca;

    return AlertDialog(

      backgroundColor: ColorsApp.colorSecundari,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(
          color: ColorsApp.colorPrimari,
          width: 2,
        ),
      ),

      title: Text(
        indexTasca == -1 ? " Quina nova tasca vols afegir?" : "Edita la tasca",
      style: TextStyle(color: ColorsApp.colorPrimari),
      ),

      content: Container(

        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,

        child: Column(
          children: [
            TextfieldPersonalitzat(controllerTitol: controllerTextTasca,),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotonDialog( 
                  textBoto: "Guardar", 
                  colorBoto: ColorsApp.colorTerciari,
                  iconBoto: Icons.save,
                  accioBoto: (){
                    indexTasca == -1 ?
                    guardarTasca(context, controllerTextTasca.text):
                    EditaTasca(context, controllerTextTasca.text, indexTasca);
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

  void EditaTasca(BuildContext context, String textDelaTasca, int indexTasca){

    RepositoriTasca repositoriTasca = RepositoriTasca();
    repositoriTasca.actualitzaTasca(indexTasca,Tasca(titol: textDelaTasca));
    Navigator.of(context).pop();
  }
    void guardarTasca(BuildContext context, String textDelaTasca){

    RepositoriTasca repositoriTasca = RepositoriTasca();
    repositoriTasca.afegirTasca(Tasca(titol: textDelaTasca));
    Navigator.of(context).pop();
  }
  void tancarDialog(BuildContext context){
    Navigator.of(context).pop();
  }
}