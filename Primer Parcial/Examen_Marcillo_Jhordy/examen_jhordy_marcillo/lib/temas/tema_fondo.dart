import 'package:flutter/material.dart';
import 'esquema_color.dart';


class FondosApp {
  static const BoxDecoration degradoPrincipal = BoxDecoration(
    gradient: LinearGradient(colors: [ColorApp.primario, ColorApp.secundario, ColorApp.acento],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  static const BoxDecoration degradeSecundario = BoxDecoration(
    color: Colors.white,
  );

  static const BoxDecoration degradeTerciario = BoxDecoration(
    color: ColorApp.fondo,
  );
}