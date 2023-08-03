import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Retornar ao menu',
      child: IconButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context, 
            '/home', 
            (route) => false);
        },
        icon: const Icon(Icons.home),
      ),
    );
  }
}
