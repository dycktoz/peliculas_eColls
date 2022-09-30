import 'package:flutter/material.dart';

import 'package:peliculas_ecolls/ui/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginScreen(),
  'register': (_) => RegisterScreen(),
  'home': (_) => HomeScreen(),
  'details': (_) => DetailsScreen()
};
