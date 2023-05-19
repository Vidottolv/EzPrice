// ignore_for_file: prefer_const_constructors

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastrarReceita extends StatelessWidget {
  final TextEditingController receitaController = TextEditingController();

  CadastrarReceita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String? nomeUsuario = '';
    String? emailUsuario = '';

    if (user != null) {
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot<Map<String, dynamic>> userData) {
        nomeUsuario = userData.get('nome');
        emailUsuario = user.email;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar Receita"),
        ),
        drawer: MenuDrawer(
          nome: nomeUsuario ?? 'Nome do Usuário',
          email: emailUsuario ?? 'Email do Usuário',
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
