import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/search/search_delegate.dart';
import 'package:provider/provider.dart';
import 'package:peliculas_ecolls/providers/providers.dart';
import 'package:peliculas_ecolls/ui/screens/screens.dart';
import 'package:peliculas_ecolls/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 251, 255),
      body: _HomePageBody(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return FavoritesPage();

      case 2:
        return PreferencesPage();

      default:
        return HomePage();
    }
  }
}
