import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/ui/pages/auth/login_page.dart';
import 'package:peliculas_ecolls/ui/pages/auth/register_page.dart';
import 'package:peliculas_ecolls/ui/pages/dashboard/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'home': (_) => HomePage(),
};
