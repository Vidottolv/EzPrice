import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/app_theme.dart';

class EsqueceuSenha extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  EsqueceuSenha({Key? key}) : super(key: key);

  void _enviarEmailTrocaSenha(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('E-mail de troca de senha enviado')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar o e-mail de troca de senha')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esqueceu a Senha'),
      ),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              Text(
                'Insira seu endereço de e-mail e enviaremos um link para redefinir sua senha.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 16),
              RoundedTextField(
                controller: emailController,
                labelText: "Email",
                hintText: 'Digite seu email',
                icon: Icons.email,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _enviarEmailTrocaSenha(context);
                },
                child: Text('Enviar e-mail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
