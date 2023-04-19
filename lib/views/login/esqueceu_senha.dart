import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

import '../components/app_theme.dart';

class EsqueceuSenha extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  EsqueceuSenha({Key? key}) : super(key: key);

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
                  // Adicione aqui a lógica para enviar o e-mail com o link de redefinição
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
