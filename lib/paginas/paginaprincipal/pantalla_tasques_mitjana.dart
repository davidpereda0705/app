import 'dart:math';

import 'package:app/colors_app.dart';
import 'package:app/components/dialog_nova_tasca.dart';
import 'package:app/components/item_tasca.dart';
import 'package:app/data/repositori_tasca.dart';
import 'package:app/data/tasca.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class PantallaTasquesMitjana extends StatefulWidget {
  const PantallaTasquesMitjana({super.key});

  @override
  State<PantallaTasquesMitjana> createState() => _PantallaTasquesMitjanaState();
}

class _PantallaTasquesMitjanaState extends State<PantallaTasquesMitjana> {
  @override
  Widget build(BuildContext context) {
    RepositoriTasca repositoriTasca = RepositoriTasca();
    return Scaffold(
      backgroundColor: ColorsApp.colorPrimari,
      appBar: AppBar(
        backgroundColor: ColorsApp.colorSecundari,
        title: Text(
          'App Tasques - Mòbil',
          style: TextStyle(color: ColorsApp.colorBlanc),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: ColorsApp.colorBlanc),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              color: ColorsApp.colorBlanc,
              boxShadow: [BoxShadow(blurRadius: 2)],
            ),
          ),
          Expanded(
            // Com tot listener, s'executa sol quan
            //"sent" ("listen") que passa algu.
            //En aquest cas, el "algu" es algun canvi en la box.
            // El que s'executa automaticament, es el builder.
            child: ValueListenableBuilder(
              valueListenable: Hive.box<List<dynamic>>(
                RepositoriTasca.nomBoxTasques,
              ).listenable(),
              //Amb el tooltip podem veure el valor que espera rebre
              // En aquest cas espera rebre una funcio que rep 3 parametres
              // i retorna un Widget
              // El tercer parametre, es un Widget que es podem passar
              // Si no es fa servir algun parametre, pero l'hem de rebre, se li acostuma a
              // posar de nom "_". En el nostre cas, no el farem servir
              // Si el fesim servir, seria un widget , que el podriem utilitzar dins del builder
              // L'advantatge de passar aquest widget, es que no es tornar a construir quan es
              //crida el builder (que es crida cada vegada que hi ha canvis a la llista).
              // Es una optmitzacio.
              builder: (context, Box<List<dynamic>> boxTasques, _) {
                final LlistaTasques = repositoriTasca.getLlistaTasques();
                return ListView.builder(
                  itemCount: LlistaTasques.length,
                  itemBuilder: (context, index) {
                    return ItemTasca(
                      valorText: LlistaTasques[index].titol,
                      indexTasca: index,
                      valorInicialCheckbox: LlistaTasques[index].completada,
                    );
                  },
                );
              },
            ),
            /*ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index){
                return ItemTasca(
                  valorText: index.toString(),
                );
              }),*/
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              obreDialogNovaTasca(context);
            },
            backgroundColor: Colors.deepPurple[300],
            child: Icon(Icons.add, color: ColorsApp.colorSecundariAccent),
            shape: CircleBorder(
              side: BorderSide(color: ColorsApp.colorSecundariAccent),
            ),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () {}, 
            backgroundColor: Colors.deepPurple[300],
            child: Icon(
              Icons.person_search,
              color: ColorsApp.colorSecundariAccent,
            ),
            shape: CircleBorder(
              side: BorderSide(color: ColorsApp.colorSecundariAccent),
            ),
          ),
        ],
      ),
    );
  }

    void obreDialogNovaTasca(BuildContext context) {
    // showDailog es una funcio de Flutter que obra un dialeg que haguem crear/definit
    showDialog(
      context: context,
      builder: (context) {
        return DialogNovaTasca();
      },
    );
  }
}
