import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/model/model_receita.dart';
import 'package:ezprice/views/util.dart';

class ReceitaController {
  void adicionar(BuildContext context, ReceitaCadastro t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Receita adicionada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(BuildContext context, String id, ReceitaCadastro t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Receita atualizada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  Future<void> excluir(BuildContext context, String id) async {
    try {
      await FirebaseFirestore.instance.collection('receitas').doc(id).delete();

      sucesso(context, 'Receita excluída com sucesso');
    } catch (e) {
      erro(context, 'ERRO: ${e.toString()}');
    }
  }

  void listar() {
    FirebaseFirestore.instance.collection('receitas');
  }
}
