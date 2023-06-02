// ignore_for_file: prefer_const_constructors

import 'package:ezprice/controller/login_controller.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/app_theme.dart';

class Precificar extends StatefulWidget {
  const Precificar({Key? key}) : super(key: key);

  @override
  State<Precificar> createState() => _PrecificarState();
}

class _PrecificarState extends State<Precificar> {
  final TextEditingController receitaController = TextEditingController();
  final TextEditingController lucroController = TextEditingController();
  final TextEditingController gasController = TextEditingController();
  final TextEditingController ingredienteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Precificar Receita'),
        ),
        body: Container(
          decoration: AppTheme.backgroundDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: receitaController,
                      labelText: "Receita",
                      hintText: "Qual é a receita?",
                      icon: Icons.bookmark_rounded),
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: lucroController,
                      labelText: "Lucro",
                      hintText: "Qual é o percentual de lucro?",
                      icon: Icons.attach_money_rounded),
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: gasController,
                      labelText: "Horas de gás",
                      hintText: "Informe em horas quanto gás é usado.",
                      icon: Icons.av_timer_rounded),
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: ingredienteController,
                      labelText: "Ingrediente",
                      hintText: "Insira o primeiro ingrediente.",
                      icon: Icons.lock_rounded),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Mais ingredientes?')),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Cadastrar'))
                ],
              ),
            ),
          ),
        ));
  }
}
