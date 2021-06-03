import 'package:flutter/material.dart';

class HomeUiProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool isLogin = true;

  var length;

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

class HomeMenuScreen with ChangeNotifier {
  final List<MenuItem> menuItems = [
    MenuItem(name: 'Inicio', icon: Icons.home),
    MenuItem(name: 'Reservas', icon: Icons.calendar_today),
    MenuItem(name: 'otros', icon: Icons.settings_cell),
    MenuItem(name: 'Mudanzas', icon: Icons.airport_shuttle),
    MenuItem(name: 'Información', icon: Icons.info),
  ];
}
