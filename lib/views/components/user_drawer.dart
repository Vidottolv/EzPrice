import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    loadUserData(); // Carregue os dados do usuário ao iniciar o Drawer
  }

  void loadUserData() async {
    try {
      // Obtenha o usuário atualmente logado no FirebaseAuth
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Acesse o documento do usuário no Firestore usando o ID do usuário logado
        DocumentSnapshot userDataSnapshot =
            await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        // Extraia os dados do usuário do DocumentSnapshot e atualize o estado do widget
        setState(() {
          userName = userDataSnapshot['name'];
          userEmail = userDataSnapshot['email'];
        });
      }
    } catch (e) {
      // Lidar com qualquer erro que possa ocorrer durante a consulta ou atualização dos dados
      print('Erro ao carregar os dados do usuário: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página Inicial'),
            onTap: () {
              // Implemente a ação para a página inicial aqui
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              // Implemente a ação para a página de configurações aqui
            },
          ),
          // Adicione mais itens do Drawer conforme necessário
        ],
      ),
    );
  }
}
