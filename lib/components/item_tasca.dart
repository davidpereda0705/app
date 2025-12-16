import 'package:app/colors_app.dart';
import 'package:app/components/dialog_nova_tasca.dart';
import 'package:app/data/repositori_tasca.dart';
import 'package:app/data/tasca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasca extends StatefulWidget {
  //final: perque no canviarà mai de valor
  //const: perque és un widget immutable
  final bool valorInicialCheckbox;
  final String valorText;
  final int indexTasca;

  const ItemTasca({
    super.key, 
    this.valorInicialCheckbox = false, 
    this.valorText = "",
    required this.indexTasca,
    });

  @override
  State<ItemTasca> createState() => _ItemTascaState();
}

class _ItemTascaState extends State<ItemTasca> {
  late bool valorCheckbox;
  //late: per quan volem declarar una variable, pero encara no sabem el valor

  @override
  void initState() {
    super.initState();

    valorCheckbox = widget.valorInicialCheckbox;
    //"widget." ho posem per accedir a les variables de la primera classe del StatefulWidget.
  }
  @override
  Widget build(BuildContext context) {

    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          icon: Icons.edit,
          backgroundColor: ColorsApp.colorPrimariAccent,
          borderRadius: BorderRadius.circular(10),
          onPressed: (context){

          }
          ),

        SlidableAction(
          icon: Icons.delete,
          backgroundColor: ColorsApp.colorPrimariAccent,
          borderRadius: BorderRadius.circular(10),
          onPressed: (context){

            RepositoriTasca repositoriTasca = RepositoriTasca();
            repositoriTasca.esborraTasca(widget.indexTasca);
          }
          ),
      ]),
      child: Container(
        margin: const EdgeInsets.all(10),
      
        padding: const EdgeInsets.all(10),
      
        decoration: BoxDecoration(
          color: ColorsApp.colorTerciari,
          borderRadius: BorderRadius.circular(20),
        ),
      
        child: Row(
          children: [
            //Checkbox
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                side: BorderSide(
                  color: ColorsApp.colorBlanc,
                  width: 2,
                  ),
                  shape: CircleBorder(),
                value: valorCheckbox, 
                checkColor: ColorsApp.colorRosa,
                activeColor: ColorsApp.colorBlanc,
                hoverColor: ColorsApp.colorSecundariAccent,
              onChanged: (valor) {
                
      //SetState: per notificar a Flutter que ha canviat l'estat del widget i que s'ha de tornar a dibuixar.
      //InitState: per inicialitzar les variables d'estat abans que el widget es construeixi.
                setState(() {
                  valorCheckbox = valor ?? false;
                  //??: si val null, posa-li el valor false
                });
                RepositoriTasca repositoriTasca = RepositoriTasca();
                Tasca tascaActualitzada = Tasca(
                  titol: widget.valorText, 
                  completada: valorCheckbox
                  );
                repositoriTasca.actualitzaTasca(widget.indexTasca, tascaActualitzada);
              }
              ),
            ),
            //Text descripcio tasca
            Text(
              widget.valorText,
              style: TextStyle(
                color: ColorsApp.colorBlanc,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    
  }

    void obreDialogEditarTasca(BuildContext context) {

    // showDailog es una funcio de Flutter que obra un dialeg que haguem crear/definit
    showDialog(
      context: context, 
      builder: (context) {

        //En aquest cas, volem que quan s'obri el dialog, ja tingui escrit el text actual.
        //(que no estigui buit com so fos una nova tasca)
          return DialogNovaTasca(textTasca: widget.valorText, indexTasca: widget.indexTasca,);
      },
      );
  }

  
}
