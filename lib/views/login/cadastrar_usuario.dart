// ignore_for_file: prefer_const_constructors

import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/app_theme.dart';

class CadastrarUsuario extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  CadastrarUsuario({Key? key}) : super(key: key);

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
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                      child: const Text('Cadastrar'))
                ],
              ),
            ),
          ),
        ));
  }
}
