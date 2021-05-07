import 'package:flutter/material.dart';
import 'package:mi_house/screens/auth/login_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.route: (ctx) => const LoginScreen(),
};
