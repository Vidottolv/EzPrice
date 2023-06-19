import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:flutter/material.dart';

class VisualizarReceitas extends StatefulWidget {
  VisualizarReceitas({Key? key}) : super(key: key);

  @override
  State<VisualizarReceitas> createState() => _VisualizarReceitasState();
}

class _VisualizarReceitasState extends State<VisualizarReceitas> {
  late String uidUsuarioLogado;
  String selectedReceitaId =
      ''; // Variável para armazenar o idReceita selecionado

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
          future: FirebaseFirestore.instance
              .collection('receitas')
              .where('uid', isEqualTo: uidUsuarioLogado)
              .get(),
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
                      String nomeReceita = item['nomeReceita'] ?? '';
                      String rendimentoReceita =
                          item['rendimento'].toString() ?? '';
                      String lucroPercentual = item['lucro'].toString() ?? '';
                      double precoVenda = item['precoVenda'] ?? 0.0;

                      // Armazenar o idReceita selecionado
                      final idReceita = document.id;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
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
                                      side: BorderSide(
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
                                          Text(
                                            'Opções',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 16),
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
                                                primary: Colors.transparent,
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
                                              child: Text(
                                                'Editar',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
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
                                                primary: Colors.transparent,
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
                                              child: Text(
                                                'Remover',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          IconButton(
                                            icon: Icon(
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
                              leading: Icon(
                                Icons.description,
                                color: Colors.white,
                              ),
                              title: Text(
                                nomeReceita,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rendimento: $rendimentoReceita',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Lucro: $lucroPercentual%',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Preço Venda: ${precoVenda.toStringAsFixed(4)}',
                                    style: TextStyle(
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
