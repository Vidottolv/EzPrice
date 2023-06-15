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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Ingredientes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/ingrediente/cadastrar');
            },
          ),
        ],
      ),
      drawer: MenuDrawer(
        nome: 'Teste de Teste de Teste',
        email: 'teste@email.com',
      ),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('receitas').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return Center(child: Text('No Data'));
            }

            final receitas = snapshot.data!.docs;

            // Obter todos os ingredientes distintos
            final ingredientes = <String>{};
            for (final receita in receitas) {
              final ingredientesReceita =
                  Set<String>.from(receita['ingredientes'] ?? []);
              ingredientes.addAll(ingredientesReceita);
            }

            return GridView.builder(
              itemCount: ingredientes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _calculateCrossAxisCount(context),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                final ingrediente = ingredientes.elementAt(index);

                return Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(ingrediente),
                    ],
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
