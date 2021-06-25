import 'package:flutter/material.dart';
import 'package:mi_house/features/auth/auth_provider.dart';
//import 'package:mi_house/screens/auth/login_screen.dart';
//import 'package:mi_house/screens/home/home_screen.dart';
import 'package:mi_house/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  static const route = 'IndexScreen';
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    switch (authProv.state) {
      case AuthStates.initial:
        //return const LoginScreen();
        return HomeScreen();
      case AuthStates.authenticated:
        return Container();
      case AuthStates.notAuthenticated:
        return Container();
    }
  }
}
