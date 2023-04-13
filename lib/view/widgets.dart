// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ezprice/view/Sobrenos.dart';
import 'package:ezprice/view/cadastro.dart';
import 'package:ezprice/view/esquecesenha.dart';
import 'package:ezprice/view/cadastrouser.dart';

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
        widgetEntrar(context),
        widgetEsqueceSenha(context),
        widgetNovaSenha(),
        widgetNomeReceita(),
      ],
    );
  }

  widgetEmail() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.person_rounded,
            color: Colors.black,
          ),
          hintText: 'Seu E-mail',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  widgetSenha() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
          hintText: 'Sua Senha',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  widgetEntrar(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cadastro()));
      },
      child: SizedBox(
        width: 50,
        height: 30,
        child: Center(
          child: Text(
            'Entrar',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  widgetNovoAqui(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CadastroUser()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          'Novo aqui? Cadastre-se',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  widgetEsqueceSenha(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EsqueceSenha()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          'Esqueceu a senha?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  widgetSobreNos(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Sobrenos()));
      },
      child: Icon(Icons.info, color: Colors.black),
    );
  }

  widgetNovaSenha() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
          hintText: 'Insira a nova senha',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  widgetNomeUser() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
          hintText: 'Qual seu nome?',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  widgetEmailUser() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
          hintText: 'Insira o email a ser usado',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  widgetCPF() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
          hintText: 'Qual seu CPF?',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  widgetConfirmaSenha() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
          hintText: 'Confirme sua senha',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

//    widgetReivindicar() {
//    return Container(
//      padding:  const EdgeInsets.fromLTRB(15, 3, 15, 3),
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(30),
//          border: Border.all(color: Colors.black)),
//      child: TextField(
//        style: TextStyle(color: Colors.black),
//        obscureText: true,
//        autofocus: true,
//        decoration: InputDecoration(
//          border: InputBorder.none,
//          icon: Icon(
//            Icons.password_rounded,
//            color: Colors.black,
//          ),
//          hintText: 'Confirme sua senha',
//          hintStyle: TextStyle(
//              color: Colors.black,
//              fontWeight: FontWeight.bold,
//              fontSize: 15),
//        ),
//      ),
//    );
//  }

  widgetNomeReceita() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
          hintText: 'Qual o nome desta receita?',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Insira o material',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Preço R\$',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Quant Kg',
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  widgetAddMaterial(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(13, 12, 12, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide(color: Colors.black),
      ),
      onPressed: () {},
      child: SizedBox(
        width: 130,
        height: 30,
        child: Center(
          child: Text(
            'Esqueceu a senha?',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
