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

class PantallaTasquesPetita extends StatefulWidget {
  const PantallaTasquesPetita({super.key});

  @override
  State<PantallaTasquesPetita> createState() => _PantallaTasquesPetitaState();
}

class _PantallaTasquesPetitaState extends State<PantallaTasquesPetita> {
  bool _mostrarListaPredefinida = false;

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
          _mostrarListaPredefinida ? 'Contactes - Mòbil' : 'App Tasques - Mòbil',
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
            child: _mostrarListaPredefinida
                ? ValueListenableBuilder(
                    valueListenable: Hive.box<List<dynamic>>(
                      RepositoriContacte.nomBoxContactes,
                    ).listenable(),
                    builder: (context, Box<List<dynamic>> boxContactes, _) {
                      final LlistaContactes = repositoriContacte
                          .getLlistaContactes();

                      if (LlistaContactes.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.contacts,
                                color: ColorsApp.colorSecundariAccent
                                    .withOpacity(0.6),
                                size: 100,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'No hi ha contactes',
                                style: TextStyle(
                                  color: ColorsApp.colorBlanc,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
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
                  )
                : ValueListenableBuilder(
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
                            valorText: (LlistaTasques[index] as Tasca).titol,
                            indexTasca: index,
                            valorInicialCheckbox:
                                (LlistaTasques[index] as Tasca).completada,
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
              if (_mostrarListaPredefinida) {
                
                _obreDialogNouContacte(context);
              } else {
               
                obreDialogNovaTasca(context);
              }
            },
            backgroundColor: Colors.deepPurple[300],
            child: Icon(
              _mostrarListaPredefinida ? Icons.person_add : Icons.add,
              color: ColorsApp.colorSecundariAccent,
            ),
            shape: CircleBorder(
              side: BorderSide(color: ColorsApp.colorSecundariAccent),
            ),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () {
              // Canvia entre llista normal i predefinida
              setState(() {
                _mostrarListaPredefinida = !_mostrarListaPredefinida;
              });
            },
            backgroundColor: Colors.deepPurple[300],
            child: Icon(
              _mostrarListaPredefinida ? Icons.menu : Icons.person_search,
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