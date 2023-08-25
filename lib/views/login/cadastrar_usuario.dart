// ignore_for_file: prefer_const_constructors

// import 'dart:ffi';
// import 'dart:html';
// import 'package:image_picker/image_picker.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/controller/login_controller.dart';
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


  final FirebaseFirestore storage = FirebaseFirestore.instance;

//  Future<void> uploadFoto(String path) async {
//   File file = File(path);
//   try {
//     String ref = 'images/img-${DateTime.now().toString()}.jpg';
//     await FirebaseFirestore.instance.doc(ref).set(file);
//   } on FirebaseException catch(e) {
//     throw Exception("Erro no upload.${e.code}");
//   }
//  }
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
                      isPassword: true,
                      icon: Icons.lock_rounded),
                  SizedBox(height: 16),
                  RoundedTextField(
                      controller: confirmarSenhaController,
                      labelText: "Confirma Senha",
                      hintText: "Confirme sua Senha",
                      isPassword: true,
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
