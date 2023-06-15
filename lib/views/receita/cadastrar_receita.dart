import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastrarReceita extends StatefulWidget {
  CadastrarReceita({Key? key}) : super(key: key);

  @override
  _CadastrarReceitaState createState() => _CadastrarReceitaState();
}

class _CadastrarReceitaState extends State<CadastrarReceita> {
  final TextEditingController receitaCont = TextEditingController();
  final TextEditingController rendimentoReceitaCont = TextEditingController();
  final TextEditingController lucroCont = TextEditingController();
  final TextEditingController gasCont = TextEditingController();
  List<TextEditingController> ingredContList = [];
  List<TextEditingController> QTDIngredContList = [];
  List<TextEditingController> precoIngredContList = [];

  @override
  void dispose() {
    receitaCont.dispose();
    rendimentoReceitaCont.dispose();
    lucroCont.dispose();
    gasCont.dispose();
    for (var controller in ingredContList) {
      controller.dispose();
    }
    for (var controller in QTDIngredContList) {
      controller.dispose();
    }
    for (var controller in precoIngredContList) {
      controller.dispose();
    }
    super.dispose();
  }

  void _cadastrarReceita(BuildContext context) async {
    final String receita = receitaCont.text;
    final String rendimentoReceita = rendimentoReceitaCont.text;
    final String lucro = lucroCont.text;
    final String gas = gasCont.text;
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    List<Map<String, dynamic>> ingredientes = [];
    double precoVenda = 0.0;

    for (int i = 0; i < ingredContList.length; i++) {
      final String ingred = ingredContList[i].text;
      final String QTDIngred = QTDIngredContList[i].text;
      final String precoIngred = precoIngredContList[i].text;

      if (ingred.isNotEmpty && QTDIngred.isNotEmpty && precoIngred.isNotEmpty) {
        double precoIngrediente = double.parse(precoIngred);
        double quantidade = double.parse(QTDIngred);

        ingredientes.add({
          'nome': ingred,
          'quantidade': quantidade,
          'preco': precoIngrediente,
        });

        precoVenda += precoIngrediente * quantidade;
      }
    }

    if (receita.isNotEmpty && ingredientes.isNotEmpty) {
      double tempoGas = double.parse(gas);
      precoVenda +=
          (1.10 * tempoGas) + (precoVenda * double.parse(lucro) / 100);

      FirebaseFirestore.instance.collection('receitas').add({
        'nome': receita,
        'rendimentoReceita': rendimentoReceita,
        'lucro': double.parse(lucro),
        'precoVenda': precoVenda,
        'ingredientes': ingredientes,
        'uid': uid,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Receita cadastrada com sucesso!')),
        );
        receitaCont.clear();
        rendimentoReceitaCont.clear();
        lucroCont.clear();
        gasCont.clear();
        for (var controller in ingredContList) {
          controller.clear();
        }
        for (var controller in QTDIngredContList) {
          controller.clear();
        }
        for (var controller in precoIngredContList) {
          controller.clear();
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar a receita.')),
        );
      });
    }
  }

  void _adicionarIngrediente() {
    setState(() {
      ingredContList.add(TextEditingController());
      QTDIngredContList.add(TextEditingController());
      precoIngredContList.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    String? nomeUsuario = 'Teste';
    String? emailUsuario = 'Teste@gmail.com';

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
        nome: nomeUsuario,
        email: emailUsuario,
      ),
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
            SizedBox(height: 10),
            RoundedTextField(
              labelText: 'Rendimento',
              hintText: 'Digite qual o rendimento da Receita',
              controller: rendimentoReceitaCont,
              icon: Icons.local_dining_rounded,
            ),
            SizedBox(height: 10),
            RoundedTextField(
              labelText: 'Lucro',
              hintText: 'Digite qual o percentual de Lucro desejado',
              controller: lucroCont,
              icon: Icons.attach_money_rounded,
            ),
            SizedBox(height: 10),
            RoundedTextField(
              labelText: 'Horas de gás',
              hintText: 'Digite quantas horas a receita leva no fogão',
              controller: gasCont,
              icon: Icons.access_time_rounded,
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                    SizedBox(height: 10),
                    RoundedTextField(
                      labelText: 'QTD Ingrediente ${index + 1}',
                      hintText: 'Qual a quantidade usada?',
                      controller: QTDIngredContList[index],
                      icon: Icons.shopping_basket_rounded,
                    ),
                    SizedBox(height: 10),
                    RoundedTextField(
                      labelText: 'Preço Ingrediente ${index + 1}',
                      hintText: 'Qual o preço pago no Kg deste ingrediente?',
                      controller: precoIngredContList[index],
                      icon: Icons.attach_money_rounded,
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: _adicionarIngrediente,
              child: Text('Adicionar Ingrediente'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _cadastrarReceita(context);
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
