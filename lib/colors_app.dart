import 'package:flutter/material.dart';
class ColorsApp {

  static Color colorPrimari = const Color.fromRGBO(255, 193, 7, 1);
  static Color colorPrimariAccent = const Color.fromARGB(255, 212, 171, 45);

  static Color colorSecundari = const Color.fromRGBO(103, 58, 183, 1);
  static Color colorSecundariAccent = const Color.fromARGB(255, 92, 25, 199);
  
  static Color colorBlanc = const Color.fromRGBO(255, 255, 255, 1);

  static Color colorTerciari = const Color.fromRGBO(76, 175, 80, 1);

    static Color colorRosa = const Color.fromARGB(255, 255, 0, 200);
}

/**
 *static:
  Si l'attribut A d'una classe és estàtic:
    - Llavors si tenim dos objectes obj1 i obj2 de la classe A, si obj1 canvia
      el valor static de A, per obj2 també es canvia. O sigui,
      comparteixen aquest valor. O sigui els static es comparteixen entre els
      objectes de la classe.
    - Podem accedir als valors de static, sense instanciar objectes de la classe.
      (Instanciar és fer: ColorsApp color = ColorsApp();)
    - Si no ho féssim static, cada vegada que volem utilitzar un color, hauríem
      de crear una nova instància de la classe (ocupant memòria per cada vegada).

/**
 * @brief Classe ColorApp
 */
class ColorApp {
public:
    /**
     * @brief Constructe una nova instància de la classe ColorApp
     */
    ColorApp();

    /**
     * @brief Mostra el valor del color en pantalla
     */
    void showColor() const;

private:
    /**
     * @brief Variable privada per a la classe ColorApp
     */
    int m_color;
};
 */