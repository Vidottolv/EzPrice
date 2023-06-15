import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/rounded_text_field.dart';

class Configurar extends StatefulWidget {
  const Configurar({Key? key});

  @override
  State<Configurar> createState() => _ConfigurarState();
}

class _ConfigurarState extends State<Configurar> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController nomeCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController novoNomeCont = TextEditingController();
  final TextEditingController novoEmailCont = TextEditingController();

  Future<void> atualizarDadosUsuario() async {
    final String novoNome = novoNomeCont.text.trim();
    final String novoEmail = novoEmailCont.text.trim();

    if (novoNome.isNotEmpty || novoEmail.isNotEmpty) {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: currentUser?.uid)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

        final Map<String, dynamic> novosDados = {};

        if (novoNome.isNotEmpty && novoNome != nomeCont.text) {
          novosDados['nome'] = novoNome;
        }

        if (novoEmail.isNotEmpty && novoEmail != emailCont.text) {
          novosDados['email'] = novoEmail;
        }

        if (novosDados.isNotEmpty) {
          await documentSnapshot.reference.update(novosDados);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Dados atualizados com sucesso!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Os dados são iguais aos já existentes.')),
          );
        }
      }
    }
  }

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
              actions: [
                Tooltip(
                  message: 'Retornar ao menu',
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                    icon: Icon(Icons.home),
                  ),
                ),
              ],
            ),
            drawer: MenuDrawer(
              nome: nome,
              email: currentUser?.email ?? '',
            ),
            body: Container(
              decoration: AppTheme.backgroundDecoration,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: Column(
                children: [
                  RoundedTextField(
                    labelText: 'Nome',
                    hintText: 'Digite o nome a alterar',
                    controller: nomeCont,
                    icon: Icons.person_rounded,
                  ),
                  SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Email',
                    hintText: 'Digite o Email a alterar',
                    controller: emailCont,
                    icon: Icons.email_rounded,
                  ),
                  SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Novo Nome',
                    hintText: 'Digite o novo nome do usuário',
                    controller: novoNomeCont,
                    icon: Icons.person_rounded,
                  ),
                  SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Novo Email',
                    hintText: 'Digite o novo Email do usuário',
                    controller: novoEmailCont,
                    icon: Icons.email_rounded,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await atualizarDadosUsuario();
                    },
                    child: Text('Enviar'),
                  ),
                ],
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
