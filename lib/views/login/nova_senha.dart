import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class NovaSenha extends StatelessWidget {
  final TextEditingController novaSenhaController = TextEditingController();
  final TextEditingController confirmarNovaSenhaController =
      TextEditingController();

  NovaSenha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(51, 24, 117, 1),
        title: const Text('Nova Senha'),
        centerTitle: true,
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
              'Digite a nova senha',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            RoundedTextField(
              labelText: "Nova Senha",
              hintText: "Digite a nova senha",
              controller: novaSenhaController,
              icon: Icons.lock_rounded,
              isPassword: true,
            ),
            SizedBox(height: 16),
            RoundedTextField(
              labelText: "Confirmar Nova Senha",
              hintText: "Confirme a nova senha",
              controller: confirmarNovaSenhaController,
              icon: Icons.lock_rounded,
              isPassword: true,
            ),
          ],
        )),
      ),
    );
  }
}
