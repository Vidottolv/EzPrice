import 'package:flutter/material.dart';
import 'package:ezprice/views/ingrediente/ingrediente.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';

class VisualizarIngredientes extends StatelessWidget {
  final List<Ingrediente> ingredientes = [
    Ingrediente(
      nome: 'Farinha de Trigo',
      quantidade: 1.0,
      unidadeMedida: 'Kg',
      preco: 7.00,
    ),
    Ingrediente(
      nome: 'Ovo',
      quantidade: 12.0,
      unidadeMedida: 'Unidade',
      preco: 15.00,
    ),
    Ingrediente(
      nome: 'Leite',
      quantidade: 1.0,
      unidadeMedida: 'L',
      preco: 5.50,
    ),
    Ingrediente(
      nome: 'Açúcar Cristal',
      quantidade: 1.0,
      unidadeMedida: 'Kg',
      preco: 4.00,
    ),
    Ingrediente(
      nome: 'Manteiga',
      quantidade: 1.0,
      unidadeMedida: 'Kg',
      preco: 17.00,
    ),
    Ingrediente(
      nome: 'Chocolate',
      quantidade: 1.0,
      unidadeMedida: 'Kg',
      preco: 36.00,
    ),
    Ingrediente(
      nome: 'Café',
      quantidade: 1.0,
      unidadeMedida: 'Kg',
      preco: 30.00,
    ),
    Ingrediente(
      nome: 'Canela',
      quantidade: 1.0,
      unidadeMedida: 'Kg',
      preco: 34.80,
    ),
  ];

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
        child: GridView.builder(
          itemCount: ingredientes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _calculateCrossAxisCount(context),
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
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
                  Text(ingredientes[index].nome),
                  Text(
                      'Qnt: ${ingredientes[index].quantidade} ${ingredientes[index].unidadeMedida}'),
                  Text(
                      'Preço: R\$ ${ingredientes[index].preco.toStringAsFixed(2)}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
