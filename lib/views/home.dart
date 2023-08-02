import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/transparent_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EzPrice"),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              TransparentCard(
                title: "Minhas Receitas",
                text:
                    "Consulte suas receitas aqui. Você pode alterar as informações ou excluir o documento clicando nele.",
                buttonText: "Consultar",
                onPressed: () {
                  Navigator.pushNamed(context, '/receita/visualizar');
                },
              ),
              const SizedBox(height: 16),
              TransparentCard(
                title: "Cadastrar Receitas",
                text: "Cadastre novas receitas no sistema.",
                buttonText: "Cadastrar",
                onPressed: () {
                  Navigator.pushNamed(context, '/receita/cadastrar');
                },
              ),
              const SizedBox(height: 16),
              TransparentCard(
                  title: "Cadastrar Materiais",
                  text: "Cadastre seus materiais aqui",
                  buttonText: "Cadastrar",
                  onPressed: () {
                    Navigator.pushNamed(context, '/ingrediente/cadastrar');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
