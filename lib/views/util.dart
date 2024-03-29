import 'package:flutter/material.dart';

//
// MENSAGEM DE ERRO
//
void erro(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromRGBO(224, 111, 114, 1),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}

//
// MENSAGEM DE SUCESSO
//
void sucesso(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromRGBO(224, 111, 114, 1),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
