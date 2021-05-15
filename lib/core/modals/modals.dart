import 'package:flutter/material.dart';

class CustomModals {
  Future<void> showError({
    required String message,
    String title = 'Oops ha ocurrido un error.\nHa esta página le ha dado\namsiedad',
    VoidCallback? onPressed,
    VoidCallback? confirmButtonAction,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ilustrations/ansiedad.png',
              width: 120,
              height: 98,
            ),
            const Text(' '),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () => onPressed == null ? Navigator.of(context).pop() : onPressed(),
            child: const Text('Salir'),
          ),
          if (confirmButtonAction != null)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                confirmButtonAction();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((_) => Colors.red),
              ),
              child: const Text('Confirmar'),
            ),
        ],
      ),
    );
  }

  Future<void> showWellDone({
    required String message,
    String title = '¡Felicitaciones!',
    VoidCallback? onPressed,
    VoidCallback? confirmButtonAction,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Image.asset(
              'assets/images/ilustrations/noansiedad.png',
              width: 118,
              height: 140,
            ),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
          if (confirmButtonAction != null)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                confirmButtonAction();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((_) => Colors.red),
              ),
              child: const Text('Confirmar'),
            ),
        ],
      ),
    );
  }
}
