// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:ezprice/model/model_ingrediente.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/components/menu_drawer.dart';
import 'package:uuid/uuid.dart';
import 'package:ezprice/views/components/back_home.dart';

import '../../controller/ingrediente_controller.dart';


class CadastrarIngrediente extends StatefulWidget {
  CadastrarIngrediente({Key?key}) : super(key:key);

  @override
  _CadastrarIngredienteState createState() => _CadastrarIngredienteState();
}

 class _CadastrarIngredienteState extends State<CadastrarIngrediente>{
  TextEditingController nomeCont = TextEditingController();
  TextEditingController unidadeMedidaCont = TextEditingController();
  TextEditingController precoCont = TextEditingController();  

  @override
  void dispose() {
    nomeCont.dispose();
    unidadeMedidaCont.dispose();
    precoCont.dispose();
    super.dispose();
  }

  void _cadastrarIngrediente(BuildContext context) async {
    String ingrediente = nomeCont.text;
    String preco = precoCont.text;
    String unidadeMedida = unidadeMedidaCont.text;
    String uid = FirebaseAuth.instance.currentUser!.uid;
  

  if (ingrediente.isNotEmpty) {
    var uuid = const Uuid();

    Ingrediente ingredienteN = Ingrediente(
        ingrediente,
        double.parse(preco.toString()),
        uid,      
        unidadeMedida,
        uuid.v4());
    IngredienteController().adicionar(context, ingredienteN);
    nomeCont.clear();
    precoCont.clear();
    unidadeMedidaCont.clear();
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Ingredientes'),
        actions: [
          CustomBackButton()
        ],
      ),
      drawer: MenuDrawer(),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            children: [
              RoundedTextField(
                labelText: 'Ingrediente',
                hintText: 'Digite o nome do ingrediente',
                controller: nomeCont,
                icon: Icons.local_cafe,
              ),
              SizedBox(height: 10),
              RoundedTextField(
                labelText: 'Unidade de Medida',
                hintText: 'Digite a unidade de medida do ingrediente',
                controller: unidadeMedidaCont,
                icon: Icons.balance_outlined,
              ),
              SizedBox(height: 10),
              RoundedTextField(
                labelText: 'Preço',
                hintText: 'Digite o preço por Kg/Lt/Unidade do ingrediente',
                controller: precoCont,
                icon: Icons.attach_money_rounded,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  _cadastrarIngrediente(context);                
                },
                 child: Text('Criar Ingrediente'),
              ),
            ],
          ),
        ),
      ));
  }
}
