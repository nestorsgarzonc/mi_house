import 'package:flutter/material.dart';

class Imageback extends StatelessWidget {
  const Imageback({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/login/backmihousee.png'),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
