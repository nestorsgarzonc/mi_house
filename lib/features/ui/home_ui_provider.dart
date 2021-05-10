import 'package:flutter/material.dart';

class HomeUiProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool isLogin = true;

  void onChangeSelectedItem(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void onChangeIsLogin({required bool newValue}) {
    isLogin = newValue;
    notifyListeners();
  }
}

class MenuItem {
  final String name;
  final IconData icon;

  MenuItem({required this.name, required this.icon});
}

final List<MenuItem> menuItems = [
  MenuItem(name: 'Inicio', icon: Icons.home),
  MenuItem(name: 'Residentes', icon: Icons.dashboard),
  MenuItem(name: 'Recepcion', icon: Icons.settings_cell),
  MenuItem(name: 'Mensajes', icon: Icons.message),
  MenuItem(name: 'Información', icon: Icons.info),
];
