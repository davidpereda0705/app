import 'package:app/colors_app.dart';
import 'package:app/components/boton_dialog.dart';
import 'package:app/components/textfield_personalitzat.dart';
import 'package:app/data/repositori_contacte.dart';
import 'package:app/data/contacte.dart';
import 'package:flutter/material.dart';

class DialogNouContacte extends StatelessWidget {

  final String nomContacte;
  final String emailContacte;
  final String contrasenyaContacte; 
  final int indexContacte;
  
  const DialogNouContacte({
    super.key,
    this.nomContacte = "",
    this.emailContacte = "",
    this.contrasenyaContacte = "", 
    this.indexContacte = -1,
  });

  @override
  Widget build(BuildContext context){

    final TextEditingController controllerNomContacte = TextEditingController();
    final TextEditingController controllerEmailContacte = TextEditingController();
    final TextEditingController controllerContrasenyaContacte = TextEditingController(); 
    
    controllerNomContacte.text = nomContacte;
    controllerEmailContacte.text = emailContacte;
    controllerContrasenyaContacte.text = contrasenyaContacte; 

    return AlertDialog(
      backgroundColor: ColorsApp.colorSecundari,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: ColorsApp.colorPrimari,
          width: 2,
        ),
      ),
      
      title: Text(
        indexContacte == -1 ? "Nou Contacte" : "Edita el Contacte",
        style: TextStyle(
          color: ColorsApp.colorPrimari,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              TextfieldPersonalitzat(
                controllerTitol: controllerNomContacte,
                hintText: "Nom del contacte",
                iconPrefix: Icons.person,
              ),
              SizedBox(height: 16),
              
              // Campo EMAIL
              TextfieldPersonalitzat(
                controllerTitol: controllerEmailContacte,
                hintText: "Email del contacte",
                iconPrefix: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              
              // Campo CONTRASEÑA 
              TextfieldPersonalitzat(
                controllerTitol: controllerContrasenyaContacte,
                hintText: "Contrasenya del contacte",
                iconPrefix: Icons.lock,
                
              ),
              SizedBox(height: 24),
              
              // BOTONES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BotonDialog(
                    textBoto: "Guardar",
                    colorBoto: ColorsApp.colorTerciari,
                    iconBoto: Icons.save,
                    accioBoto: (){
                      if (indexContacte == -1) {
                        guardarContacte(
                          context, 
                          controllerNomContacte.text,
                          controllerEmailContacte.text,
                          controllerContrasenyaContacte.text 
                        );
                      } else {
                        editaContacte(
                          context,
                          controllerNomContacte.text,
                          controllerEmailContacte.text,
                          controllerContrasenyaContacte.text, 
                          indexContacte
                        );
                      }
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
      ),
    );
  }

  void editaContacte(BuildContext context, String nom, String email, String contrasenya, int indexContacte){ 
    RepositoriContacte repositoriContacte = RepositoriContacte();
    repositoriContacte.actualitzaContacte(
      indexContacte,
      Contacte(nom: nom, email: email, contrasenya: contrasenya) 
    );
    Navigator.of(context).pop();
  }
  
  void guardarContacte(BuildContext context, String nom, String email, String contrasenya){ 
    RepositoriContacte repositoriContacte = RepositoriContacte();
    
    // Validación básica
    if (nom.isEmpty) {
      _mostrarError(context, "El nom és obligatori");
      return;
    }
    
    if (contrasenya.isEmpty) { 
      _mostrarError(context, "La contrasenya és obligatòria");
      return;
    }
    
    repositoriContacte.afegirContacte(
      Contacte(nom: nom, email: email, contrasenya: contrasenya) 
    );
    Navigator.of(context).pop();
  }
  
  void tancarDialog(BuildContext context){
    Navigator.of(context).pop();
  }
  
  void _mostrarError(BuildContext context, String missatge) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(missatge),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}