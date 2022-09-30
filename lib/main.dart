import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/providers/movies_provider.dart';
import 'package:peliculas_ecolls/providers/ui_provider.dart';
import 'package:peliculas_ecolls/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas eColls App',
      initialRoute: 'register',
      routes: appRoutes,
    );
  }
}
