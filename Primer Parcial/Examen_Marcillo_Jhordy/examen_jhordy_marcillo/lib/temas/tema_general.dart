import 'package:flutter/material.dart';
import 'esquema_color.dart';
import 'tema_boton.dart';
import 'tema_fondo.dart';
import 'tema_appbar.dart';
import 'tema_formulario.dart';
import './tipografía.dart';

class TemaGeneral{
  static ThemeData claro = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: ColorApp.primario,
      secondary: ColorApp.secundario,
      background: ColorApp.fondo,
      onPrimary: ColorApp.textoClaro,
      onSecondary: ColorApp.textoOscuro,
    ),
    textTheme: TipografiaApp.texto,
    appBarTheme: TemaAppBar.estilo,
    elevatedButtonTheme: TemaBotones.botonPrincipal,
    outlinedButtonTheme: TemaBotones.botonSecundario,
    inputDecorationTheme: TemaFormulario.campoTexto,
    scaffoldBackgroundColor: ColorApp.fondo,
  );
}