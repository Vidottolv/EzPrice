// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:ezprice/controller/ingrediente_controller.dart';
import 'package:flutter/material.dart';

class remover_ingrediente extends StatefulWidget {
  @override
  State<remover_ingrediente> createState() => _RemoverIngredienteState();
}

class _RemoverIngredienteState extends State<remover_ingrediente> {
  String idIngrediente = '';

  //Tornando o Receita Controller Excluir um método local, para limpar a chamada do método dentro do código
  void delete() {
    IngredienteController().excluir(context, idIngrediente);
  }

  //Aqui estamos chamando uma função que gera o estado de informações de uma PageRoute para outra
  //Ou seja, aqui nós vamos nos certificar de que quando passamos o idReceita como método
  //lá no Visualizar Receitas esteja vindo para cá e alimentando o idReceita
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    idIngrediente = ModalRoute.of(context)?.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remover Ingrediente'),
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
            mainAxisAlignment: MainAxisAlignment
                .center, //alinha esta child (onde teremos os escritos) ao centro
            children: [
              Text(
                'Tem certeza de que deseja \nremover o ingrediente?',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              InkWell(
                // "Botão" de exclusão
                onTap: () => delete(), //chamada do método de exclusão
                child: Text(
                  'Remova aqui!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
