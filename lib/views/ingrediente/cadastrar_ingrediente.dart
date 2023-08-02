import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastrarIngrediente extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController unidadeMedidaController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  CadastrarIngrediente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Ingredientes'),
      ),
      drawer: MenuDrawer(),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              RoundedTextField(
                labelText: 'Ingrediente',
                hintText: 'Digite o nome do ingrediente',
                controller: nomeController,
                icon: Icons.food_bank,
              ),
              SizedBox(height: 16.0),
              RoundedTextField(
                labelText: 'Quantidade',
                hintText: 'Digite a quantidade do ingrediente',
                controller: quantidadeController,
                icon: Icons.format_list_numbered,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              RoundedTextField(
                labelText: 'Unidade de Medida',
                hintText: 'Digite a unidade de medida do ingrediente',
                controller: unidadeMedidaController,
                icon: Icons.format_list_numbered,
              ),
              SizedBox(height: 16.0),
              RoundedTextField(
                labelText: 'Preço',
                hintText: 'Digite o preço do ingrediente',
                controller: precoController,
                icon: Icons.monetization_on,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Função para salvar os dados do ingrediente
                },
                child: Text('Criar Ingrediente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
