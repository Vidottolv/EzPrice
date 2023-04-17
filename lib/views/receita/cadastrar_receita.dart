// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ezprice/views/components/app_theme.dart';

class CadastrarReceita extends StatelessWidget {
  const CadastrarReceita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Text("Cadastrar Receita"),
    );
  }
}
