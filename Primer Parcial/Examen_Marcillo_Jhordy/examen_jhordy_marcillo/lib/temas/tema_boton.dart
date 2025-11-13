import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaBotones{
  static final botonPrincipal = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(

      backgroundColor: ColorApp.primario,

      foregroundColor: ColorApp.textoClaro,

      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 12,),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),

      textStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,),
    ),
  );

  static final botonSecundario = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(

        backgroundColor: ColorApp.secundario,

        foregroundColor: ColorApp.textoClaro,

        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),

        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,),


        side: BorderSide(color: ColorApp.primario)
    ),
  );


}