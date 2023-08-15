import 'package:flutter/material.dart';

import '../../controller/login_controller.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(231, 161, 122, 0.92),
          ),
          accountName: FutureBuilder<String>(
            future: LoginController().getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(snapshot.data ?? '');
              } else {
                return const Text("Carregando...");
              }
            },
          ),
          accountEmail: FutureBuilder<String>(
            future: LoginController().getUserEmail(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(snapshot.data ?? '');
              } else {
                return const Text("Carregando...");
              }
            },
          ),
          currentAccountPicture: const CircleAvatar(
            child: Icon(Icons.person),
            backgroundColor: Color.fromRGBO(225, 144, 99, 1),
            foregroundColor: Colors.white,
          ),
        ),
        ListTile(
          title: const Text("Consultar Receitas"),
          tileColor: const Color.fromRGBO(225, 144, 99, 1),
          leading: const Icon(Icons.list, color: Colors.white),
          onTap: () {
            Navigator.pushNamed(context, '/receita/visualizar');
          },
        ),
        // ListTile(
        // title: const Text("Consultar Ingredientes"),
        // tileColor: Colors.black.withOpacity(0.6),
        // leading: const Icon(Icons.list, color: Colors.white),
        // onTap: () {
        // Navigator.pushNamed(context, '/ingrediente/visualizar');
        // },
        // // ),
        // ListTile(
        // // title: const Text("Precificação"),
        // // tileColor: Colors.black.withOpacity(0.6),
        // // leading: const Icon(Icons.list, color: Colors.white),
        // // onTap: () {
        // //   Navigator.pushNamed(context, '/receita/precificacao');
        //   // },
        // // ),
        ListTile(
          title: const Text("Sobre o EzPrice"),
          tileColor: const Color.fromRGBO(225, 144, 99, 1),
          leading: const Icon(Icons.info, color: Colors.white),
          onTap: () {
            Navigator.pushNamed(context, '/sobre');
          },
        ),
        ListTile(
          title: const Text("Configurações"),
          tileColor: const Color.fromRGBO(225, 144, 99, 1),
          leading: const Icon(Icons.settings, color: Colors.white),
          onTap: () {
            Navigator.pushNamed(context, '/configuracao');
          },
        ),
        ListTile(
          title: const Text("Menu"),
          tileColor: const Color.fromRGBO(225, 144, 99, 1),
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
          tileColor: const Color.fromRGBO(225, 144, 99, 1),
          leading: const Icon(Icons.exit_to_app, color: Colors.white),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
        ),
      ]),
    );
  }
}
