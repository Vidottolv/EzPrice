import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/model/model_receita.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../controller/login_controller.dart';
import '../../controller/receita_controller.dart';
import '../../model/ingrediente.dart';

class EdicaoReceita extends StatefulWidget {
  final String idReceita;

  EdicaoReceita({required this.idReceita});

  @override
  State<EdicaoReceita> createState() =>
      _EdicaoReceitaState(idReceita: idReceita);
}

class _EdicaoReceitaState extends State<EdicaoReceita> {
  final String idReceita;
  final List<Ingrediente> ingredientesList = [];

  bool isLoading = false;
  String nomeReceita = '';
  String rendimento = '';
  String lucroPercentual = '';
  String gas = '';
  String precoVenda = '';

  final String uid = FirebaseAuth.instance.currentUser!.uid;

  _EdicaoReceitaState({required this.idReceita});

  void atualizar() {
    var uuid = Uuid();

    ReceitaCadastro receitaA = ReceitaCadastro(
        nomeReceita,
        double.parse(gas),
        rendimento,
        uid,
        double.parse(lucroPercentual),
        ingredientesList,
        double.parse(precoVenda),
        uuid.v4());
    ReceitaController().atualizar(context, idReceita, receitaA);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EzPrice"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: atualizar,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MenuDrawer(
        email: '',
        nome: '',
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/gradMorpheu.png'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: ListView(
                children: [
                  RoundedTextField(
                    labelText: 'Nome da Receita',
                    hintText: '',
                    icon: Icons.local_cafe,
                    controller: TextEditingController(text: nomeReceita),
                  ),
                  const SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Rendimento da Receita',
                    hintText: '',
                    icon: Icons.shopping_basket,
                    controller: TextEditingController(text: rendimento),
                  ),
                  const SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Lucro Percentual',
                    hintText: '',
                    icon: Icons.monetization_on,
                    controller: TextEditingController(text: lucroPercentual),
                  ),
                  const SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Preço do Gás',
                    hintText: '',
                    icon: Icons.local_gas_station,
                    controller: TextEditingController(text: gas),
                  ),
                  const SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Preço de Venda',
                    hintText: '',
                    icon: Icons.attach_money,
                    controller: TextEditingController(text: precoVenda),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Ingredientes:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // FutureBuilder<List<ReceitaCadastro>>(
                  //     future: ReceitaController().listReceita(context),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.none ||
                  //           snapshot.connectionState ==
                  //               ConnectionState.waiting ||
                  //           snapshot.data!.isEmpty) {
                  //         return const Center(
                  //           child: Text(
                  //             'Você ainda não possui receitas.',
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold, fontSize: 18),
                  //           ),
                  //         );
                  //       } else {
                  //         return Expanded(
                  //           child: ListView.builder(
                  //             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //             itemCount: snapshot.data!.length,
                  //             itemBuilder: (context, index) {
                  //               ReceitaCadastro receita = snapshot.data![index];
                  //               return SizedBox(
                  //                 width:
                  //                     MediaQuery.of(context).size.width * 0.5,
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(15.0),
                  //                   ),
                  //                   borderOnForeground: true,
                  //                   elevation: 8,
                  //                   child: ListTile(
                  //                     trailing: Row(
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: [
                  //                         IconButton(
                  //                           icon: const Icon(Icons.edit,
                  //                               color: Colors.black),
                  //                           onPressed: () {},
                  //                         ),
                  //                         const SizedBox(width: 8),
                  //                         IconButton(
                  //                             icon: const Icon(Icons.delete,
                  //                                 color: Colors.red),
                  //                             onPressed: () {}),
                  //                       ],
                  //                     ),
                  //                     onTap: () {
                  //                       // Navigator.push(
                  //                       //   context,
                  //                       //   MaterialPageRoute(
                  //                       //     builder: (context) =>
                  //                       //         CalculationDetailsPage(
                  //                       //             calculation:
                  //                       //                 snapshot.data![index]),
                  //                       //   ),
                  //                       // );
                  //                     },
                  //                     title: FutureBuilder<String>(
                  //                         future:
                  //                             LoginController().loggedUser(),
                  //                         builder: (context, snapshot) {
                  //                           if (snapshot.connectionState ==
                  //                               ConnectionState.done) {
                  //                             return Text(receita.nomeReceita,
                  //                                 style: const TextStyle(
                  //                                     fontWeight:
                  //                                         FontWeight.bold));
                  //                           }

                  //                           return const Text(
                  //                             'Cálculo inválido',
                  //                             style: TextStyle(
                  //                                 fontWeight: FontWeight.bold),
                  //                           );
                  //                         }),
                  //                     subtitle: Text(
                  //                       receita.nomeReceita,
                  //                       style: const TextStyle(
                  //                           color: Color(0xffFFA123)),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         );
                  //       }
                  //     })
                ],
              ),
            ),
    );
  }
}
