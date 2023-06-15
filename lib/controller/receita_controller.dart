import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/model/model_receita.dart';
import 'package:ezprice/views/util.dart';

class ReceitaController {
  void adicionar(context, ReceitaCadastro t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Receita adicionada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, ReceitaCadastro t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Receita atualizada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Receita excluída com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'));
  }

  void listar() {
    FirebaseFirestore.instance.collection('receitas');
  }
}
