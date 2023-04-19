import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ezprice/views/components/app_theme.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre a EzPrice'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: AppTheme.backgroundDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          child: Center(
            child: Column(
              children: [
                Text(
                  'EzPrice',
                  style: GoogleFonts.pacifico(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Quem somos nós?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/89951349?v=4'),
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/73846881?v=4'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Projeto desenvolvido por Lucas e João, alunos da Faculdade de Tecnologia de Ribeirão Preto (FATEC) para a matéria de Dispositivos Móveis do Professor, Doutor Rodrigo Plotze. O objetivo do EzPrice é ajudar os usuários, microempreendedores e pessoas que querem trabalhar com vendas de alimentos, a precificar receitas de forma rápida e fácil, possibilitando o cálculo do preço de venda utilizando o preço dos ingredientes, e possibilitando adicionar a margem de lucro desejada.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Como funciona?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Você apenas precisa cadastrar os ingredientes, nos contando o preço das embalagens compradas, exemplo: Um pacote de farinha de trigo de 1kg por 6 reais.\nEm seguida você irá adicionar suas receitas nos contando o quanto gasta de cada ingrediente e o quanto esta receita rende.\nNós calcularemos para você um preço de venda justo para cada receita, e você poderá adicionar a margem de lucro desejada.',
                ),
                const SizedBox(height: 16),
                const Text('O que é preciso para utilizar o EzPrice?'),
                const SizedBox(height: 16),
                const Text(
                  'Para utilizar o EzPrice você precisa apenas de um dispositivo móvel com acesso a internet para se cadastrar e logar, ou uma conta no Google.\nUtilizamos a internet para armazenar os dados dos usuários, e para que você possa acessar suas receitas em qualquer lugar, sem precisar se preocupar com a segurança dos seus dados.',
                ),
                const Text(
                  'Nosso código está disponível no GitHub, sinta-se livre para contribuir com o projeto: ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    Uri url = Uri.parse('https://github.com/Vidottolv/EzPrice');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Não foi possível abrir $url';
                    }
                  },
                  child: Text('Ver no GitHub'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
