import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const route = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/backmihouse.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                /*Porque como estas editando mi codigo me corre aca, sera trasnmitirte y que veas lo que pasa xd raios esta bien*/
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.bottomRight,
                    end: FractionalOffset.topRight,
                    stops: [
                      0.1,
                      0.5,
                    ],
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Colors.white.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  stops: [
                    0.1,
                    0.7,
                    1.9,
                  ],
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Color(0xff7C8CF0),
                    Color(0xff5067F2),
                  ],
                ),
              ),
              height: size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(), // TODO: Mensaje de Hola!
                  TextField(
                    decoration: const InputDecoration(
                      //hoverColor: Colors.white,
                      //fillColor: Colors.white,
                      //filled: true,
                      labelText: 'Correo',
                      prefixIcon: Icon(Icons.email),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
