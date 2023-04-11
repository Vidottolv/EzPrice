// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

//import 'package:app01_hello_world/esquecesenha.dart';
import 'package:flutter/material.dart';
//import 'package:app01_hello_world/sobrenos.dart';
//import 'package:app01_hello_world/cadastro.dart';

class Widgets extends StatelessWidget {
  const Widgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widgetEmail(),
        widgetSenha(),
        widgetSobreNos(context),
        widgetConfirmaSenha(),
//        widgetEntrar(context),
        //      widgetEsqueceSenha(context),
        widgetNovaSenha(),
        widgetNomeReceita(),
      ],
    );
  }

  widgetEmail() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.person_rounded,
            color: Color.fromRGBO(136, 196, 77, 0.9),
          ),
          hintText: 'Seu E-mail',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }

  widgetSenha() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Color.fromRGBO(136, 196, 77, 0.9),
          ),
          hintText: 'Sua Senha',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }
//
//  widgetEntrar(BuildContext context) {
//    return ElevatedButton(
//      style: ElevatedButton.styleFrom(
//        backgroundColor: Color.fromRGBO(13, 12, 12, 0),
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//        side: BorderSide(color: Color.fromRGBO(136, 196, 77, 0.9)),
//       ),
//      onPressed: () {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => Cadastro()));
//      },
//      child: SizedBox(
//        width: 50,
//        height: 30,
//        child: Center(
//          child: Text(
//            'Entrar',
//            style: TextStyle(color: Color.fromRGBO(136, 196, 77, 0.9)),
//          ),
//        ),
//      ),
//    );
//  }

//  widgetEsqueceSenha(BuildContext context) {
//    return ElevatedButton(
//      style: ElevatedButton.styleFrom(
//        primary: Color.fromRGBO(13, 12, 12, 0),
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//        side: BorderSide(color: Color.fromRGBO(136, 196, 77, 0.9)),
//      ),
//      onPressed: () {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => EsqueceSenha()));
//      },
//      child: SizedBox(
//        width: 130,
//        height: 30,
//        child: Center(
//          child: Text(
//            'Esqueceu a senha?',
//            style: TextStyle(color: Color.fromRGBO(136, 196, 77, 0.9)),
//          ),
//        ),
//      ),
//    );
//  }

  widgetSobreNos(BuildContext context) {
    return InkWell(
//      onTap: () {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => Sobrenos()));
//      },
//      child: Icon(Icons.info, color: const Color.fromRGBO(136, 196, 77, 0.9)),
        );
  }

  widgetNovaSenha() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Color.fromRGBO(136, 196, 77, 0.9),
          ),
          hintText: 'Insira a nova senha',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }

  widgetConfirmaSenha() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Color.fromRGBO(136, 196, 77, 0.9),
          ),
          hintText: 'Confirme sua senha',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }

//    widgetReivindicar() {
//    return Container(
//      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(20),
//          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
//      child: TextField(
//        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
//        obscureText: true,
//        autofocus: true,
//        decoration: InputDecoration(
//          border: InputBorder.none,
//          icon: Icon(
//            Icons.password_rounded,
//            color: Color.fromRGBO(136, 196, 77, 0.9),
//          ),
//          hintText: 'Confirme sua senha',
//          hintStyle: TextStyle(
//              color: Color.fromRGBO(136, 196, 77, 0.9),
//              fontWeight: FontWeight.bold,
//              fontSize: 15),
//        ),
//      ),
//    );
//  }

  widgetNomeReceita() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Color.fromRGBO(136, 196, 77, 0.9),
          ),
          hintText: 'Qual o nome desta receita?',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }

  widgetMateriais() {
    return Container(
      height: 40,
      width: 200,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Insira o material',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }

  widgetPrecoCadastro() {
    return Container(
      height: 40,
      width: 100,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Preço R\$',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }

  widgetQuantidade() {
    return Container(
      height: 40,
      width: 100,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color.fromRGBO(136, 196, 77, 0.9))),
      child: TextField(
        style: TextStyle(color: Color.fromRGBO(136, 196, 77, 1)),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Quant Kg',
          hintStyle: TextStyle(
              color: Color.fromRGBO(136, 196, 77, 0.9),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }

  widgetAddMaterial(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(13, 12, 12, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(color: Color.fromRGBO(136, 196, 77, 0.9)),
      ),
      onPressed: () {},
      child: SizedBox(
        width: 130,
        height: 30,
        child: Center(
          child: Text(
            'Esqueceu a senha?',
            style: TextStyle(color: Color.fromRGBO(136, 196, 77, 0.9)),
          ),
        ),
      ),
    );
  }
}