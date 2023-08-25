import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ezprice/views/components/app_theme.dart';
import 'package:ezprice/views/ingrediente/cadastrar_ingrediente.dart';
import 'package:ezprice/views/ingrediente/visualizar_ingredientes.dart';
import 'package:ezprice/views/ingrediente/remover_ingrediente.dart';
import 'package:ezprice/views/login/login.dart';
import 'package:ezprice/views/login/cadastrar_usuario.dart';
import 'package:ezprice/views/login/esqueceu_senha.dart';
import 'package:ezprice/views/login/nova_senha.dart';
import 'package:ezprice/views/receita/cadastrar_receita.dart';
import 'package:ezprice/views/receita/EdicaoReceita.dart';
import 'package:ezprice/views/receita/precificacao.dart';
import 'package:ezprice/views/receita/remover_receita.dart';
import 'package:ezprice/views/receita/visualizar_receitas.dart';
import 'package:ezprice/views/receita/infos_receita.dart';
import 'package:ezprice/views/configuracao.dart';
import 'package:ezprice/views/home.dart';
import 'package:ezprice/views/sobre.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      title: 'EzPrice',
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/cadastrar': (context) => CadastrarUsuario(),
        '/esqueceu-senha': (context) => EsqueceuSenha(),
        '/esqueceu-senha/nova-senha': (context) => NovaSenha(),
        '/home': (context) => Home(),
        '/sobre': (context) => const Sobre(),
        '/ingrediente/cadastrar': (context) => CadastrarIngrediente(),
        '/ingrediente/visualizar': (context) => VisualizarIngredientes(),
        '/receita/cadastrar': (context) => CadastrarReceita(),
        '/receita/visualizar': (context) => VisualizarReceitas(),
        '/receita/precificacao': (context) => const Precificar(
              nome: '',
            ),
        '/configuracao': (context) => const Configurar(),
        '/receita/EdicaoReceita': (context) => EdicaoReceita(
              idReceita: '',
            ),
        '/receita/remover_receita': (context) => RemoverReceita(),
        '/ingrediente/remover_ingrediente': (context) => remover_ingrediente(),
        '/receita/infos_receita':(context) => Visualizar()
      },
    ),
  );
}
