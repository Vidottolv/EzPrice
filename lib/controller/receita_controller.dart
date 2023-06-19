import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezprice/views/receita/receita.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/model/model_receita.dart';
import 'package:ezprice/views/util.dart';

import 'login_controller.dart';

class ReceitaController {
  void adicionar(context, ReceitaCadastro t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(t.idReceita)
        .set(t.toJson())
        .then((value) => sucesso(context, 'Receita adicionada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.pushNamedAndRemoveUntil(
            context, '/home', (route) => false));
  }

  void atualizar(context, id, ReceitaCadastro t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(t.idReceita)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Receita atualizada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void excluir(context, idReceita) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(idReceita)
        .delete()
        .then((value) => sucesso(context, 'Receita excluída com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'));
  }

  Future<List<ReceitaCadastro>> listReceita(context) async {
    try {
      var userId = await LoginController().getUserId();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('receitas')
          .where('uid', isEqualTo: userId)
          .get();
      List<ReceitaCadastro> receitas = [];
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        ReceitaCadastro receita = ReceitaCadastro.fromJson(data);
        receitas.add(receita);
      }
      return receitas;
    } catch (e) {
      erro(context, 'Erro no retorno da receita, tente novamente.');
      return [];
    }
  }
}
