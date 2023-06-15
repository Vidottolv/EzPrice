import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class EdicaoReceita extends StatefulWidget {
  final String nomeReceita;

  EdicaoReceita({required this.nomeReceita});

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
        .where('nome', isEqualTo: widget.nomeReceita)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final document = snapshot.docs.first;
      final data = document.data();

      nomeReceita = data['nome'] ?? '';
      rendimentoReceita = data['rendimentoReceita'] ?? '';
      lucroPercentual = data['lucro'] ?? '';
      gas = data['gas'] ?? '';

      final List<dynamic> ingredientes = data['ingredientes'] ?? [];

      for (int i = 0; i < ingredientes.length; i++) {
        final ingrediente = ingredientes[i]['ingrediente'] ?? '';
        final quantidade = ingredientes[i]['quantidade'] ?? '';
        final preco = ingredientes[i]['preco'] ?? '';

        ingredientesList.add({
          'ingrediente': ingrediente,
          'quantidade': quantidade,
          'preco': preco,
        });
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
                  SizedBox(height: 20),
                  Text(
                    'Ingredientes:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ingredientesList.length,
                    itemBuilder: (context, index) {
                      final ingrediente =
                          ingredientesList[index]['ingrediente'];
                      final quantidade = ingredientesList[index]['quantidade'];
                      final preco = ingredientesList[index]['preco'];

                      return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingrediente: $ingrediente',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Quantidade: $quantidade',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Preço Pago: $preco',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
