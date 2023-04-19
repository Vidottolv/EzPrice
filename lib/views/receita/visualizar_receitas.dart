import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:ezprice/views/ingrediente/ingrediente.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/receita/receita.dart';

class VisualizarReceitas extends StatelessWidget {
  final List<Receita> receitas = [
    Receita(
      receita: 'Café com Leite',
      ingedientes: [
        Ingrediente(
          nome: 'Café',
          quantidade: 1.0,
          unidadeMedida: 'Kg',
          preco: 30.00,
        ),
        Ingrediente(
          nome: 'Açúcar Cristal',
          quantidade: 1.0,
          unidadeMedida: 'Kg',
          preco: 4.00,
        ),
        Ingrediente(
          nome: 'Leite',
          quantidade: 1.0,
          unidadeMedida: 'L',
          preco: 5.50,
        ),
      ],
    )
  ];

  VisualizarReceitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Receitas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/receita/cadastrar');
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
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: ListView.builder(
          itemCount: receitas.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.white, width: 1),
              ),
              child: ListTile(
                title: Text(
                  receitas[index].receita,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  receitas[index].ingedientes.map((e) => e.nome).join('\n'),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
