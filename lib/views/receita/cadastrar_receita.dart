// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

//import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<TextEditingController> ingredContList = [];
  List<TextEditingController> qtdIngredContList = [];
  List<TextEditingController> precoIngredContList = [];
  int contador = 0;
  List<Ingrediente> ingredientesFirestore = [];

  @override
  void initState() {
    super.initState();
    // obterIngredientesFirestore();
  }

  // Future<void> obterIngredientesFirestore() async{
  //   try {
  //     var querySnapshot = await FirebaseFirestore.instance
  //     .collection('ingredientes')
  //     .get();

  //     List<Ingrediente> ingredientes = querySnapshot.docs.map((doc) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       return Ingrediente(
  //         ingrediente: data['nome'] ?? '',
  //         preco: data['preco'],
          
  //         // ... outros campos do ingrediente ...
  //       );
  //     }).toList();
  //   } catch (e) {
  //     print ('Erro ao obter os ingredientes do Firestore');
  //   }
  // }

  @override
  void dispose() {
    receitaCont.dispose();
    rendimento.dispose();
    lucroCont.dispose();
    gasCont.dispose();
    for (var controller in ingredContList) {
      controller.dispose();
    }
    for (var controller in qtdIngredContList) {
      controller.dispose();
    }
    for (var controller in precoIngredContList) {
      controller.dispose();
    }
    super.dispose();
  }

  void _cadastrarReceita(BuildContext context) async {
    final String nomeReceita = receitaCont.text;
    final String rendimentoReceita = rendimento.text;
    final String lucro = lucroCont.text;
    final String gas = gasCont.text;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    List<Ingrediente> ingredientes = [];
    double precoVenda = 0.0;
    int contador = 0;

    for (int i = 0; i < ingredContList.length; i++) {
      final String ingred = ingredContList[i].text;
      final String qtdIngred = qtdIngredContList[i].text;
      contador = ingredContList.length;

      if (ingred.isNotEmpty && qtdIngred.isNotEmpty) {
        int quantidade = int.parse(qtdIngred);

        //  Ingrediente ingrediente = Ingrediente(
        //    ingred,
        //    quantidade,
        //    precoIngrediente,
        //  )

        //  ingredientes.add(ingrediente);

        precoVenda += quantidade;
      }
    }

    if (nomeReceita.isNotEmpty && ingredientes.isNotEmpty) {
      double tempoGas = double.parse(gas);
      precoVenda +=
          (1.10 * tempoGas) + (precoVenda * double.parse(lucro) / 100);

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
      for (var controller in ingredContList) {
        controller.clear();
      }
      for (var controller in qtdIngredContList) {
        controller.clear();
      }
      for (var controller in precoIngredContList) {
        controller.clear();
      }
    }
  }

  void _adicionarIngrediente() {
    setState(() {
      contador++;
      ingredContList.add(TextEditingController());
      qtdIngredContList.add(TextEditingController());
      precoIngredContList.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("EzPrice"),
        actions: [
          CustomBackButton()
        ],
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ingredContList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    RoundedTextField(
                      labelText: 'Ingrediente ${index + 1}',
                      hintText: 'Digite qual o ingrediente',
                      controller: ingredContList[index],
                      icon: Icons.local_dining_rounded,
                    ),
                    const SizedBox(height: 10),
                    RoundedTextField(
                      labelText: 'QTD Ingrediente ${index + 1}',
                      hintText: 'Qual a quantidade usada?',
                      controller: qtdIngredContList[index],
                      icon: Icons.shopping_basket_rounded,
                    ),
                    const SizedBox(height: 10),
                    RoundedTextField(
                      labelText: 'Preço Ingrediente ${index + 1}',
                      hintText: 'Qual o preço pago no Kg deste ingrediente?',
                      controller: precoIngredContList[index],
                      icon: Icons.attach_money_rounded,
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: _adicionarIngrediente,
              child: const Text('Adicionar Ingrediente'),
            ),
            const SizedBox(height: 10),
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
