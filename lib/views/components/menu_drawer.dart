import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  final String nome;
  final String email;

  const MenuDrawer({
    Key? key,
    required this.nome,
    required this.email,
  }) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.nome),
            accountEmail: Text(widget.email),
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            title: const Text("Consultar Receitas"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.list, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/receita/visualizar');
            },
          ),
          ListTile(
            title: const Text("Consultar Ingredientes"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.list, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/ingrediente/visualizar');
            },
          ),
          ListTile(
            title: const Text("Precificação"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.list, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/receita/precificacao');
            },
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
            onTap: () {
              Navigator.pushNamed(context, '/configuracao');
            },
          ),
          ListTile(
            title: const Text("Menu"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
          ),
          ListTile(
            title: const Text("Sair"),
            tileColor: Colors.black.withOpacity(0.6),
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
