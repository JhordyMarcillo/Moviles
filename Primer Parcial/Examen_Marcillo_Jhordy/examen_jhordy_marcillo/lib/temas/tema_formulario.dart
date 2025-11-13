import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaFormulario {
  static final campoTexto = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white24,
    labelStyle: TextStyle(color: Colors.black),
    prefixIconColor: ColorApp.primario,


    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorApp.primario, width: 50),
        borderRadius: BorderRadius.circular(5)),

    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(5)
    ),
  );
}