import 'package:flutter/material.dart';
import '../routes/route_names.dart';
import '../view/paginas/home_page.dart';
import '../view/paginas/resultado_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> rutas = {
    RouteNames.home: (context) => HomePage(),
    RouteNames.resultado: (context) => ResultadoPage(),
  };
}
