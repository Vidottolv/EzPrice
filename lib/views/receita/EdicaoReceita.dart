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

  Future<void> atualizarDadosReceita() async {
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

      data['nome'] = nomeReceita;
      data['rendimentoReceita'] = rendimentoReceita;
      data['lucro'] = lucroPercentual;
      data['gas'] = gas;

      final List<Map<String, dynamic>> ingredientes = [];

      for (int i = 0; i < ingredientesList.length; i++) {
        final ingrediente = ingredientesList[i]['ingrediente'];
        final quantidade = ingredientesList[i]['quantidade'];
        final preco = ingredientesList[i]['preco'];

        ingredientes.add({
          'ingrediente': ingrediente,
          'quantidade': quantidade,
          'preco': preco,
        });
      }

      data['ingredientes'] = ingredientes;

      await document.reference.update(data);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados da receita atualizados com sucesso!')),
      );
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
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: atualizarDadosReceita,
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
                    controller: TextEditingController(text: rendimentoReceita),
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
                  const SizedBox(height: 20),
                  const Text(
                    'Ingredientes:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ingredientesList.length,
                    itemBuilder: (context, index) {
                      final ingrediente =
                          ingredientesList[index]['ingrediente'];
                      final quantidade = ingredientesList[index]['quantidade'];
                      final preco = ingredientesList[index]['preco'];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingrediente: $ingrediente',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Quantidade: $quantidade',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Preço Pago: $preco',
                              style: const TextStyle(fontSize: 16),
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
