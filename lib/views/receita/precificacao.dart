import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Precificar extends StatefulWidget {
  final String nome;

  const Precificar({Key? key, required this.nome}) : super(key: key);

  @override
  _PrecificarState createState() => _PrecificarState();
}

class _PrecificarState extends State<Precificar> {
  String? _nomeReceita;
  Future<double>? _precoIdeal;
  List<dynamic> _ingredientesList = [];
  bool _mostrarIngredientes = false;

  @override
  void initState() {
    super.initState();
    _nomeReceita = widget.nome;
  }

  Future<double> _calcularPrecoIdeal(BuildContext context) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('receitas')
              .where('nome', isEqualTo: _nomeReceita)
              .get();

      final List<DocumentSnapshot> documents = snapshot.docs;

      if (documents.isNotEmpty) {
        final DocumentSnapshot document = documents.first;

        final Map<String, dynamic> receitaData =
            document.data() as Map<String, dynamic>;

        final List<dynamic> ingredientes = receitaData['ingredientes'];
        final double gas = double.parse(receitaData['gas']);

        double total = 0;

        for (var ingrediente in ingredientes) {
          final double precoIngrediente = double.parse(ingrediente['preco']);
          final double quantidadeUsada =
              double.parse(ingrediente['quantidade']);

          total += (precoIngrediente * quantidadeUsada);
        }

        total += (1.10 * gas);

        final double lucro = double.parse(receitaData['lucro']);
        final double precoIdeal = total / (1 - lucro / 100);

        setState(() {
          _ingredientesList = ingredientes;
        });

        return precoIdeal;
      }

      return 0.0;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao calcular o preço ideal')),
      );
      return 0.0;
    }
  }

  void _mostraIngredientes() {
    setState(() {
      _mostrarIngredientes = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preço Ideal da Receita'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/gradMorpheu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vamos calcular o preço de venda desta receita?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _precoIdeal = _calcularPrecoIdeal(context);
                  });
                },
                child: Text('Calcular'),
              ),
              SizedBox(height: 16),
              FutureBuilder<double>(
                future: _precoIdeal,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erro ao calcular o preço ideal');
                  } else if (snapshot.hasData) {
                    final precoIdeal = snapshot.data!;
                    return Text(
                      'Preço Ideal: $precoIdeal',
                      style: TextStyle(fontSize: 18),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(height: 16),
              if (_mostrarIngredientes && _ingredientesList.isNotEmpty)
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => _mostraIngredientes(),
                      child: Text('Mostrar Ingredientes'),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _ingredientesList.length,
                      itemBuilder: (context, index) {
                        final ingrediente = _ingredientesList[index];
                        return ListTile(
                          title: Text(ingrediente['nome']),
                          subtitle:
                              Text('Quantidade: ${ingrediente['quantidade']}'),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
