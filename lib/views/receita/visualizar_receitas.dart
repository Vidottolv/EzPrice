// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/components/back_home.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:flutter/material.dart';

class VisualizarReceitas extends StatefulWidget {

  @override
  State<VisualizarReceitas> createState() => _VisualizarReceitasState();
}

class _VisualizarReceitasState extends State<VisualizarReceitas> {
  late String uidUsuarioLogado;
  String selectedReceitaId = '';

  @override
  void initState() {
    super.initState();
    obterUidUsuarioLogado();
  }

  Future<void> obterUidUsuarioLogado() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        uidUsuarioLogado = user.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Visualizar Receitas'),
        actions: [
          CustomBackButton()
        ],
      ),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('receitas')
              .where('uid', isEqualTo: uidUsuarioLogado)
              .get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
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
                      String nomeReceita = item['nomeReceita'] ?? '';
                      String rendimentoReceita = item['rendimento'].toString();
                      String lucroPercentual = item['lucro'].toString();
                      double precoVenda = item['precoVenda'] ?? 0.0;

                      // Armazenar o idReceita selecionado
                      String idReceita = document.id;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          color: const Color.fromRGBO(231, 161, 122, 0.92),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    backgroundColor:
                                        const Color.fromRGBO(231, 161, 122, 0.92),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Opções',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromRGBO(225, 144, 99, 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                // Passar o idReceita para a função de editar
                                                Navigator.pushNamed(
                                                  context,
                                                  '/receita/EdicaoReceita',
                                                  arguments: idReceita,
                                                );
                                              },
                                              child: const Text(
                                                'Editar',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromRGBO(225, 144, 99, 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                // Passar o idReceita para a função de remover
                                                Navigator.pushNamed(context,
                                                    '/receita/remover_receita',
                                                    arguments: idReceita);
                                              },
                                              child: const Text(
                                                'Remover',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromRGBO(225, 144, 99, 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                // Passar o idReceita para a função de remover
                                                Navigator.pushNamed(context,
                                                    '/receita/infos_receita',
                                                    arguments: idReceita);
                                              },
                                              child: const Text(
                                                'Visualizar',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: ListTile(
                              leading: const Icon(
                                Icons.menu_book_rounded,
                                color: Colors.white,
                              ),
                              title: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  nomeReceita,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rendimento: $rendimentoReceita',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Lucro: $lucroPercentual%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Preço Venda: ${precoVenda.toStringAsFixed(3)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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
