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
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar Usuário'),
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
                      controller: nomeController,
                      labelText: "Nome",
                      hintText: "Qual o seu nome?",
                      icon: Icons.person_rounded),
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Digite seu Email",
                      icon: Icons.email_rounded),
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: senhaController,
                      labelText: "Senha",
                      hintText: "Digite sua Senha",
                      icon: Icons.lock_rounded),
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: confirmarSenhaController,
                      labelText: "Confirma Senha",
                      hintText: "Confirme sua Senha",
                      icon: Icons.lock_rounded),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        LoginController().criarConta(
                            context,
                            nomeController.text,
                            emailController.text,
                            senhaController.text);
                      },
                      child: const Text('Cadastrar'))
                ],
              ),
            ),
          ),
        ));
  }
}
