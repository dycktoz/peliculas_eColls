import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas eColls App',
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}
