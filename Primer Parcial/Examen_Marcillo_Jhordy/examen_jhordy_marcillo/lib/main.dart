import 'package:flutter/material.dart';
import 'routes/app_route.dart';
import 'temas/index.dart';

void main() {
  runApp(BancoApp());
}

class BancoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Bandido de Peluche',
      debugShowCheckedModeBanner: false,
      theme: TemaGeneral.claro,
      initialRoute: '/',
      routes: AppRoutes.rutas,
    );
  }
}
