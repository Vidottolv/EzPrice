// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/components/back_home.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:flutter/material.dart';

class VisualizarIngredientes extends StatefulWidget {

  @override
  State<VisualizarIngredientes> createState() => _VisualizarIngredientesState();
}

class _VisualizarIngredientesState extends State<VisualizarIngredientes> {
  late String uidUsuarioLogado;
  String selectedIngredienteId = '';

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
        title: const Text('Visualizar Ingredientes'),
        actions: [
          CustomBackButton()
        ],
      ),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('ingredientes')
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
                      String ingrediente = item['ingrediente'] ?? '';
                      String preco = item['preco'].toString();
                      String unidadeMedida = item['unidadeMedida'].toString();

                      // Armazenar o idIngrediente selecionado
                      String idIngrediente = document.id;

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
                          color: Colors.transparent,
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
                                        Colors.black87.withOpacity(0.8),
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
                                          const SizedBox(height: 16),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
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
                                                  '/ingrediente/editar_ingrediente',
                                                  arguments: idIngrediente,
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                // Passar o idReceita para a função de remover
                                                Navigator.pushNamed(context,
                                                    '/ingrediente/remover_ingrediente',
                                                    arguments: idIngrediente);
                                              },
                                              child: const Text(
                                                'Remover',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
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
                                  ingrediente,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Preço unitário: R\$$preco',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Unidade: $unidadeMedida',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
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
