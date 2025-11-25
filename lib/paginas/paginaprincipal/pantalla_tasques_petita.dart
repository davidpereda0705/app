import 'dart:math';

import 'package:app/colors_app.dart';
import 'package:app/components/dialog_nova_tasca.dart';
import 'package:app/components/item_tasca.dart';
import 'package:flutter/material.dart';

class PantallaTasquesPetita extends StatelessWidget {
  
  const PantallaTasquesPetita({super.key});

  @override
  Widget build(BuildContext context) {
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
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index){
                return ItemTasca(
                  valorText: index.toString(),
                );
              }),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.deepPurple[300],
            child:  Icon(Icons.heart_broken, color: ColorsApp.colorSecundariAccent),
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorSecundariAccent)),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () {
              obreDialogNovaTasca(context);

            },
            backgroundColor: Colors.deepPurple[300],
            child: Icon(Icons.add, color: ColorsApp.colorSecundariAccent),
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorSecundariAccent)),
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
