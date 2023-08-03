// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/model/model_ingrediente.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/model/model_receita.dart';
import 'package:ezprice/views/util.dart';

import 'login_controller.dart';

class IngredienteController {
  //Adicionando receitas dentro do nosso banco de dados
  void adicionar(context, Ingrediente t) {
    FirebaseFirestore.instance
        .collection('ingredientes')
        .doc(t.idIngrediente)
        .set(t.toJson())
        .then((value) => sucesso(context, 'Ingrediente adicionado com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.pushNamedAndRemoveUntil(
            context, '/home', (route) => false));
  }

    void excluir(context, idIngrediente) async {
    await FirebaseFirestore.instance
        .collection('ingredientes')
        .doc(idIngrediente)
        .delete()
        .then((value) => sucesso(context, 'Ingrediente excluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.pushNamedAndRemoveUntil(
          context, '/home', (route) => false));
  }

  // void atualizar(context, idIngrediente) async {
  //   await FirebaseFirestore.instance
  //   .collection('ingredientes')
  //   .doc()
  // }

}