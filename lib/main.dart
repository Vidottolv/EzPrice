import 'package:ezprice/views/home.dart';
import 'package:ezprice/views/sobre.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/login/login.dart';
import 'package:ezprice/views/login/cadastrar_usuario.dart';
import 'package:ezprice/views/login/esqueceu_senha.dart';
import 'package:ezprice/views/login/nova_senha.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      title: 'EzPrice',
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/cadastrar': (context) => CadastrarUsuario(),
        '/esqueceu-senha': (context) => EsqueceuSenha(),
        '/esqueceu-senha/nova-senha': (context) => NovaSenha(),
        '/home': (context) => const Home(),
        '/sobre': (context) => const Sobre(),
      }));
}
