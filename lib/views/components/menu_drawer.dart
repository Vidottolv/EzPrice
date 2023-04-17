import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final String nome;
  final String email;

  const MenuDrawer({
    Key? key,
    required this.nome,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(nome),
            accountEmail: Text(email),
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            title: const Text("Consultar Receitas"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.list, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Consultar Ingredientes"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.list, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Precificação"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.list, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Sobre o EzPrice"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.info, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/sobre');
            },
          ),
          ListTile(
            title: const Text("Configurações"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.settings, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Sair"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
