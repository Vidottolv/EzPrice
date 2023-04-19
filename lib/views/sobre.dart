import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre a EzPrice'),
      ),
      drawer: MenuDrawer(email: "aaa.@aaa.com", nome: "aaa"),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            children: [
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
                'Projeto desenvolvido por João e Lucas, alunos da Faculdade de Tecnologia de Ribeirão Preto (FATEC). O objetivo do EzPrice é ajudar os usuários a precificar receitas e ingredientes de forma rápida e fácil, possibilitando o cálculo do preço de venda e margem de lucro desejada.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
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
    );
  }
}
