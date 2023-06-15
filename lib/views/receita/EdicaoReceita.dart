import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:ezprice/views/components/transparent_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/home.dart';
import 'package:ezprice/main.dart';

class EdicaoReceita extends StatefulWidget {
  final String receitaNome;

  EdicaoReceita({required this.receitaNome});

  @override
  State<EdicaoReceita> createState() => _EdicaoReceitaState();
}

class _EdicaoReceitaState extends State<EdicaoReceita> {
  final List<Map<String, String>> ingredientesList = [];

  bool isLoading = false;
  String nomeReceita = '';
  String rendimentoReceita = '';
  String lucroPercentual = '';
  String gas = '';

  @override
  void initState() {
    super.initState();
    _loadReceitaData();
  }

  Future<void> _loadReceitaData() async {
    setState(() {
      isLoading = true;
    });

    final snapshot = await FirebaseFirestore.instance
        .collection('receitas')
        .where('nome', isEqualTo: widget.receitaNome)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final document = snapshot.docs.first;
      final data = document.data();

      nomeReceita = data['nome'] ?? '';
      rendimentoReceita = data['rendimentoReceita'] ?? '';
      lucroPercentual = data['lucro'] ?? '';
      gas = data['gas'] ?? '';

      final List<dynamic> ingredientes = data['ingrediente'] ?? [];
      final List<dynamic> qtdIngredientes = data['quantidade'] ?? [];

      for (int i = 0; i < ingredientes.length; i++) {
        final ingrediente = ingredientes[i] ?? '';
        final qtdIngrediente = qtdIngredientes[i] ?? '';

        ingredientesList
            .add({'ingrediente': ingrediente, 'quantidade': qtdIngrediente});
      }
    }

    setState(() {
      isLoading = false;
    });
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
          icon: Icon(Icons.home),
        ),
      ),
      drawer: MenuDrawer(
        email: '',
        nome: '',
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
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
                  SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Rendimento da Receita',
                    hintText: '',
                    icon: Icons.shopping_basket,
                    controller: TextEditingController(text: rendimentoReceita),
                  ),
                  SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Lucro Percentual',
                    hintText: '',
                    icon: Icons.monetization_on,
                    controller: TextEditingController(text: lucroPercentual),
                  ),
                  SizedBox(height: 10),
                  RoundedTextField(
                    labelText: 'Preço do Gás',
                    hintText: '',
                    icon: Icons.local_gas_station,
                    controller: TextEditingController(text: gas),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _mostraIngredientes,
                    child: Text('Mostrar Ingredientes'),
                  ),
                  SizedBox(height: 10),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: widget.receitaNome.isNotEmpty
                        ? FirebaseFirestore.instance
                            .collection('receitas')
                            .doc(widget.receitaNome)
                            .snapshots()
                            .map((snapshot) => snapshot.data()
                                as QuerySnapshot<Map<String, dynamic>>)
                        : null, // Retorna null se o valor de widget.receitaNome for vazio
                    builder: (context, snapshot) {
                      if (snapshot == null || !snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final receitaData = snapshot.data!.docs.first.data();
                      final List<dynamic> ingredientes =
                          receitaData['ingrediente'] ?? [];
                      final List<dynamic> qtdIngredientes =
                          receitaData['quantidade'] ?? [];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: _mostraIngredientes,
                            child: Text('Mostrar Ingredientes'),
                          ),
                          SizedBox(height: 10),
                          if (ingredientes.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                ingredientes.length,
                                (index) => Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ingrediente: ${ingredientes[index]}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Quantidade: ${qtdIngredientes[index]}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  void _mostraIngredientes() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Mostrando ingredientes...')),
    );
  }
}
