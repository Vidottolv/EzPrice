import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/transparent_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: currentUser?.uid)
          .limit(1)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          final DocumentSnapshot documentSnapshot = snapshot.data!.docs.first;
          final String nome = documentSnapshot.get('nome') as String;

          return Scaffold(
            appBar: AppBar(
              title: const Text("EzPrice"),
            ),
            drawer: MenuDrawer(
              nome: nome,
              email: currentUser?.email ?? '',
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
                      title: "Consultar Receitas",
                      text:
                          "Consulte as receitas cadastradas no sistema, e veja o valor de cada uma delas.",
                      buttonText: "Consultar",
                      onPressed: () {
                        Navigator.pushNamed(context, '/receita/visualizar');
                      },
                    ),
                    SizedBox(height: 16),
                    TransparentCard(
                      title: "Consultar Ingredientes",
                      text:
                          "Consulte os ingredientes cadastrados no sistema, e veja o valor de cada um deles.",
                      buttonText: "Consultar",
                      onPressed: () {
                        Navigator.pushNamed(context, '/ingrediente/visualizar');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        // Caso não seja possível obter o nome do usuário, pode retornar um widget vazio ou fazer algo diferente
        return SizedBox();
      },
    );
  }
}
