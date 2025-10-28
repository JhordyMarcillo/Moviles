import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numeros',
      initialRoute: '/',
      routes: appRoutes,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}