import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('hola'),
          ),
        ],
      ),
    );
  }
}
