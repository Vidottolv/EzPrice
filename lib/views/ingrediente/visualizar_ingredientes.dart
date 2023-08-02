import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';

class VisualizarIngredientes extends StatelessWidget {
  VisualizarIngredientes({Key? key}) : super(key: key);

  int _calculateCrossAxisCount(BuildContext context) {
    // Obtém a largura do dispositivo
    double screenWidth = MediaQuery.of(context).size.width;

    // Calcula o número de colunas com base na largura do dispositivo
    int crossAxisCount = (screenWidth ~/ 150)
        .clamp(1, 4); // Ajuste o valor 150 de acordo com o tamanho do card

    return crossAxisCount;
  }

  Future<List<String>> _getIngredientes() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('receitas').get();
    final receitas = snapshot.docs;

    // Lista de todos os ingredientes
    final ingredientes = <String>[];

    // Percorrer todas as receitas
    for (final receita in receitas) {
      final ingredientesReceita =
          List<Map<String, dynamic>>.from(receita['ingredientes'] ?? []);
      for (final ingrediente in ingredientesReceita) {
        final nomeIngrediente = ingrediente['ingrediente'] as String?;
        if (nomeIngrediente != null) {
          ingredientes.add(nomeIngrediente);
        }
      }
    }

    return ingredientes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Ingredientes'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          },
        ),
      ),
      drawer: MenuDrawer(),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: FutureBuilder<List<String>>(
          future: _getIngredientes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return Center(child: Text('No Data'));
            }

            final ingredientes = snapshot.data!;

            return ListView.builder(
              itemCount: ingredientes.length,
              itemBuilder: (context, index) {
                final ingrediente = ingredientes[index];

                return Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  child: ListTile(
                    title: Text(ingrediente),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
