import 'dart:math';

import 'package:app/colors_app.dart';
import 'package:app/components/dialog_nova_tasca.dart';
import 'package:app/components/dialog_nou_contacte.dart';
import 'package:app/components/item_tasca.dart';
import 'package:app/components/item_contacte.dart';
import 'package:app/data/repositori_tasca.dart';
import 'package:app/data/repositori_contacte.dart';
import 'package:app/data/tasca.dart';
import 'package:app/data/contacte.dart';
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
  void initState() {
    super.initState();
    _inicialitzarContactesProva();
  }

  Future<void> _inicialitzarContactesProva() async {
    final repositoriContacte = RepositoriContacte();
    final llistaContactes = repositoriContacte.getLlistaContactes();

    if (llistaContactes.isEmpty) {
      await repositoriContacte.inicialitzarAmbDadesProva();
    }
  }

  @override
  Widget build(BuildContext context) {
    RepositoriTasca repositoriTasca = RepositoriTasca();
    RepositoriContacte repositoriContacte = RepositoriContacte();
    
    return Scaffold(
      backgroundColor: ColorsApp.colorPrimari,
      appBar: AppBar(
        backgroundColor: ColorsApp.colorSecundari,
        title: Text(
          'App Tasques - Tablet',
          style: TextStyle(color: ColorsApp.colorBlanc),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: ColorsApp.colorBlanc),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: ColorsApp.colorBlanc,
                    width: 2,
                  ),
                ),
              ),
              child: _buildColumnaTasques(repositoriTasca),
            ),
          ),
          Expanded(
            child: _buildColumnaContactes(repositoriContacte),
          ),
        ],
      ),
    );
  }

  //TASQUES
  Widget _buildColumnaTasques(RepositoriTasca repositoriTasca) {
    return Column(
      children: [
        Expanded(
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
              if (LlistaTasques.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.checklist_outlined,
                        color: ColorsApp.colorSecundariAccent.withOpacity(0.6),
                        size: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No hi ha tasques\nPrem + per afegir-ne',
                        style: TextStyle(
                          color: ColorsApp.colorBlanc.withOpacity(0.7),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 80), 
                itemCount: LlistaTasques.length,
                itemBuilder: (context, index) {
                  return ItemTasca(
                    valorText: (LlistaTasques[index] as Tasca).titol,
                    indexTasca: index,
                    valorInicialCheckbox:
                        (LlistaTasques[index] as Tasca).completada,
                  );
                },
              );
            },
          ),
        ),

        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              FloatingActionButton(
                onPressed: () {
                  obreDialogNovaTasca(context);
                },
                backgroundColor: Colors.deepPurple[300],
                child: Icon(
                  Icons.add,
                  color: ColorsApp.colorSecundariAccent,
                ),
                shape: CircleBorder(
                  side: BorderSide(color: ColorsApp.colorSecundariAccent),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // CONTACTES
  Widget _buildColumnaContactes(RepositoriContacte repositoriContacte) {
    return Column(
      children: [

        Expanded(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<List<dynamic>>(
              RepositoriContacte.nomBoxContactes,
            ).listenable(),
            builder: (context, Box<List<dynamic>> boxContactes, _) {
              final LlistaContactes = repositoriContacte.getLlistaContactes();
              
              if (LlistaContactes.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.contacts_outlined,
                        color: ColorsApp.colorSecundariAccent.withOpacity(0.6),
                        size: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No hi ha contactes\nPrem + per afegir-ne',
                        style: TextStyle(
                          color: ColorsApp.colorBlanc.withOpacity(0.7),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 80), 
                itemCount: LlistaContactes.length,
                itemBuilder: (context, index) {
                  final contacte = LlistaContactes[index];
                  if (contacte is Contacte) {
                    return ItemContacte(
                      nom: contacte.nom,
                      email: contacte.email,
                      contrasenya: contacte.contrasenya,
                      indexContacte: index,
                    );
                  } else {
                    return Container();
                  }
                },
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              FloatingActionButton(
                onPressed: () {
                  _obreDialogNouContacte(context);
                },
                backgroundColor: Colors.deepPurple[300],
                child: Icon(
                  Icons.person_add,
                  color: ColorsApp.colorSecundariAccent,
                ),
                shape: CircleBorder(
                  side: BorderSide(color: ColorsApp.colorSecundariAccent),
                ),
              ),
            ],
          ),
        ),
      ],
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

  void _obreDialogNouContacte(BuildContext context) {
    // showDailog es una funcio de Flutter que obra un dialeg que haguem crear/definit
    showDialog(
      context: context,
      builder: (context) {
        return DialogNouContacte();
      },
    );
  }
}