// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';

class CadastrarReceita extends StatelessWidget {
  final TextEditingController receitaController = TextEditingController();

  CadastrarReceita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar Receita"),
        ),
        drawer: MenuDrawer(
          nome: 'Teste de Teste de Teste',
          email: 'teste@email.com',
        ),
        body: Container(
          decoration: AppTheme.backgroundDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          child: Column(
            children: [
              RoundedTextField(
                labelText: 'Receita',
                hintText: 'Digite o nome da receita',
                controller: receitaController,
                icon: Icons.food_bank,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ));
  }
}
