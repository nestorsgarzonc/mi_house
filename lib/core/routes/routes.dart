import 'package:flutter/material.dart';
import 'package:mi_house/screens/auth/index_screen.dart';
import 'package:mi_house/screens/auth/login_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  IndexScreen.route: (ctx) => const IndexScreen(),
  LoginScreen.route: (ctx) => const LoginScreen(),
};
