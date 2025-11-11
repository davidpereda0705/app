import 'package:app/colors_app.dart';
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
      body: const Center(child: Text('Pantalla de tasques petita (mòbil)')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.deepPurple[300],
            child:  Icon(Icons.add, color: ColorsApp.colorSecundariAccent),
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorSecundariAccent)),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.deepPurple[300],
            child: Icon(Icons.remove, color: ColorsApp.colorSecundariAccent),
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorSecundariAccent)),
          ),
        ],
      ),
    );
  }
}
