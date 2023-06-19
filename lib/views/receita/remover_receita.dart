import 'dart:js';

import 'package:ezprice/controller/receita_controller.dart';
import 'package:flutter/material.dart';

class RemoverReceita extends StatelessWidget {
  final String idReceita;

  const RemoverReceita({Key? key, required this.idReceita}) : super(key: key);

  void _removerReceita() {
    ReceitaController().excluir(context, idReceita);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remover Receita'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/gradMorpheu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tem certeza de que deseja remover a receita?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _removerReceita,
                child: Text('Remover'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
