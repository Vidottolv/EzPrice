import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/controller/receita_controller.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/ingrediente/ingrediente.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/receita/receita.dart';

class VisualizarReceitas extends StatelessWidget {
  VisualizarReceitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Receitas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/receita/cadastrar');
            },
          ),
        ],
      ),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('receitas').get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> item =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.description),
                          //title: Text(item['nomeReceita']),
                          //subtitle: Text(item['redimentoReceita']),
                          onTap: () {},
                          onLongPress: () {
                            // ReceitaController.excluir(context, id);
                          },
                        ),
                      );
                    }).toList(),
                  );
                }
                return Container();
            }
          },
        ),
      ),
    );
  }
}
