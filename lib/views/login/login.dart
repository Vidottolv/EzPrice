// ignore_for_file: prefer_const_constructors

import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/forgot_password.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ezprice/controller/login_controller.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/sobre');
            },
          ),
        ],
      ),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EzPrice',
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 16),
                RoundedTextField(
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Digite seu Email",
                  icon: Icons.person_rounded,
                ),
                SizedBox(height: 10),
                RoundedTextField(
                  controller: senhaController,
                  labelText: "Senha",
                  isPassword: true,
                  hintText: "Digite sua Senha",
                  icon: Icons.lock_rounded,
                ),
                SizedBox(height: 20),
                ForgotPasswordLink(onPressed: () {
                  Navigator.pushNamed(context, '/esqueceu-senha');
                }),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastrar');
                        },
                        child: Text('Cadastrar-se')),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          LoginController().login(context, emailController.text,
                              senhaController.text);
                        },
                        child: Text('Entrar')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
