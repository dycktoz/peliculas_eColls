import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final index = uiProvider;
    return BottomNavigationBar(
        onTap: (int i) => index.selectedMenuOpt = i,
        currentIndex: index.selectedMenuOpt,
        backgroundColor: Color.fromARGB(255, 228, 228, 228),
        elevation: 100,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.house_outlined,
                size: 35,
              )),
          BottomNavigationBarItem(
            label: 'Discover',
            icon: Icon(Icons.star_border_outlined, size: 35),
          ),
          BottomNavigationBarItem(
              label: 'Settings', icon: Icon(Icons.settings, size: 35)),
        ]);
  }
}
