import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/transparent_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String nome = "Teste de Teste de Teste";
  final String email = "teste@email.com";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("EzPrice"),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(51, 24, 117, 1),
        ),
        drawer: MenuDrawer(
          nome: nome,
          email: email,
        ),
        body: Container(
          decoration: AppTheme.backgroundDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                TransparentCard(
                  title: "Precificação",
                  text:
                      "Pedindo o valor dos ingredientes da receita, e assim calculando quanto você pode vender a mesma e lucrar, pode até mesmo escolher a margem de lucro desejada.",
                  buttonText: "Começar",
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                TransparentCard(
                  title: "Consultar Receitas",
                  text:
                      "Consulte as receitas cadastradas no sistema, e veja o valor de cada uma delas.",
                  buttonText: "Consultar",
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                TransparentCard(
                  title: "Consultar Ingredientes",
                  text:
                      "Consulte os ingredientes cadastrados no sistema, e veja o valor de cada um deles.",
                  buttonText: "Consultar",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
