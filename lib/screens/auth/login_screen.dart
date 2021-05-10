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
              color: Colors.blueGrey,
              height: size.height * 0.4,
              // child:(
              //   Image.asset('assets/images/housebackground.png',fit: BoxFit.cover,)
              // ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [Colors.blue, Colors.black],
                ),
              ),
              height: size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(),
                  TextFormField(
                    decoration: const InputDecoration(
                      hoverColor: Colors.white,
                      fillColor: Colors.white,
                      filled: true,
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
