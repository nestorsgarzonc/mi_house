import 'package:flutter/material.dart';

class LoginLabel extends StatelessWidget {
  const LoginLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '¡Hola!',
              style: TextStyle(
                  fontSize: 50.0, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          children: [
            Text(
              'Inicia sesion en Mi house',
              style: TextStyle(
                  fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}