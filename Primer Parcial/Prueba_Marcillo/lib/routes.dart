import 'package:flutter/material.dart';
import 'view/numeros_view.dart';
import 'view/resultado_view.dart';


final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => Numeros_View(),
  '/result': (context) => ResultView(),
};