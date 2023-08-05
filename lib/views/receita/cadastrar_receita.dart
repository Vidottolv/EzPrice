// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/controller/receita_controller.dart';
import 'package:ezprice/model/model_ingrediente.dart';
import 'package:ezprice/model/model_receita.dart';
import 'package:ezprice/views/components/back_home.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CadastrarReceita extends StatefulWidget {
  CadastrarReceita({Key? key}) : super(key: key);

  @override
  _CadastrarReceitaState createState() => _CadastrarReceitaState();
}

class _CadastrarReceitaState extends State<CadastrarReceita> {
  TextEditingController receitaCont = TextEditingController();
  TextEditingController rendimento = TextEditingController();
  TextEditingController lucroCont = TextEditingController();
  TextEditingController gasCont = TextEditingController();
  Map<String, bool> ingredientesSelecionadosCheckbox =
      {}; // Mapa para controlar os ingredientes selecionados
  Map<String, double> ingredienteseSuasQuantidades =
      {}; // Mapa para armazenar os ingredientes selecionados e suas quantidades correspondentes

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    receitaCont.dispose();
    rendimento.dispose();
    lucroCont.dispose();
    gasCont.dispose();
    super.dispose();
  }

  void _cadastrarReceita(BuildContext context) async {
    final String nomeReceita = receitaCont.text;
    final String rendimentoReceita = rendimento.text;
    final String lucro = lucroCont.text;
    final String gas = gasCont.text;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    List<Ingrediente> ingredientes = [];
    int contador = 0;

    if (nomeReceita.isNotEmpty && ingredientes.isNotEmpty) {
      // double tempoGas = double.parse(gas);
      double precoVenda = 1.10;
      //     (1.10 * tempoGas) + (precoVenda * double.parse(lucro) / 100);

      var uuid = const Uuid();

      ReceitaCadastro receitaN = ReceitaCadastro(
          nomeReceita,
          double.parse(gas),
          rendimentoReceita,
          uid,
          double.parse(lucro),
          ingredientes,
          precoVenda,
          uuid.v4(),
          int.parse(contador.toString()));
      ReceitaController().adicionar(context, receitaN);
      receitaCont.clear();
      rendimento.clear();
      lucroCont.clear();
      gasCont.clear();
      ingredientesSelecionadosCheckbox.clear();
      ingredienteseSuasQuantidades.clear();
    }
  }

  // void _adicionarIngrediente() {
  //   setState(() {
  //     contador++;
  //     // ingredContList.add(TextEditingController());
  //     // qtdIngredContList.add(TextEditingController());
  //     // precoIngredContList.add(TextEditingController());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EzPrice"),
        actions: [CustomBackButton()],
      ),
      drawer: const MenuDrawer(),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          children: [
            RoundedTextField(
              labelText: 'Receita',
              hintText: 'Digite o nome da receita',
              controller: receitaCont,
              icon: Icons.local_cafe,
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              labelText: 'Rendimento',
              hintText: 'Digite qual o rendimento da Receita',
              controller: rendimento,
              icon: Icons.local_dining_rounded,
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              labelText: 'Lucro',
              hintText: 'Digite qual o percentual de Lucro desejado',
              controller: lucroCont,
              icon: Icons.attach_money_rounded,
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              labelText: 'Horas de gás',
              hintText: 'Digite quantas horas a receita leva no fogão',
              controller: gasCont,
              icon: Icons.access_time_rounded,
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredientes:',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('ingredientes')
                  .orderBy('ingrediente',
                      descending:
                          false) // Ordena os documentos pelo campo 'ingrediente'
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text("Nenhum item encontrado."),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    var item = snapshot.data!.docs[index];
                    var nomeItem = item['ingrediente'] ??
                        'Sem nome'; // Supondo que 'nome' é um campo no documento
                    return ListTile(
                      leading: Checkbox(
                        value:
                            ingredientesSelecionadosCheckbox[nomeItem] ?? false,
                        onChanged: (value) {
                          setState(() {
                            ingredientesSelecionadosCheckbox[nomeItem] = value ??
                                false; // Atualiza a variável para controlar a visibilidade
                            if (value == true) {
                              ingredienteseSuasQuantidades[nomeItem] =
                                  0.0; // Inicializa a quantidade do ingrediente como 0
                            } else {
                              ingredienteseSuasQuantidades.remove(
                                  nomeItem); // Remove o ingrediente do mapa caso seja deselecionado
                            }
                          });
                        },
                      ),
                      title: Text(
                        nomeItem,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
                );
              }),
            ),
            ...ingredienteseSuasQuantidades.entries.map((entry) {
              var nomeItem = entry.key;
              var quantidade = entry.value;
              return Column(
                children: [
                  RoundedTextField(
                    labelText: 'Quantidade de $nomeItem',
                    hintText: 'Digite a quantidade de $nomeItem a ser usada.',
                    controller:
                        TextEditingController(text: quantidade.toString()),
                    icon: Icons.local_dining,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),

            // ElevatedButton(
            //   onPressed: _adicionarIngrediente,
            //   child: const Text('Adicionar Ingrediente'),
            // ),
            // const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _cadastrarReceita(context);
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
