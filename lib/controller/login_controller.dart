// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ezprice/views/util.dart';

class LoginController{
  final String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  
  bool isValidEmail(String email) {
  RegExp regex = RegExp(emailRegex);
  return regex.hasMatch(email);
  }

  criarConta(context, nome, email, senha) {
    if(nome.isEmpty || email.isEmpty || senha.isEmpty){
      erro(context, 'Preencha todos os campos.');
      return;
    } 

    if(isValidEmail(email))
    {
      erro(context, 'O formato do email é inválido.');
    }

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    ).then((resultado) {
      //Conta Criada com Sucesso
      FirebaseFirestore.instance.collection('usuarios').add({
        'uid': resultado.user!.uid,
        'nome': nome,
        'email': email,
        'senha': senha
      });

      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      //Não foi possível criar a conta
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

Future<String> getUserName() async {
  var user = '';
  await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then(
    (result) {
      user = result.docs[0].data()['nome'] ?? '';
    },
  );

  return user;
}

Future<String> getUserEmail() async {
  var email = '';

  await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then(
    (result) {
      email = result.docs[0].data()['email'] ?? '';
    },
  );

  return email;
}

  //
  // LOGIN
  // Efetuar o login de um usuário previamente cadastrado
  // no serviço Firebase Authentication
  //
  login(context, email, senha) {
    if(email.isEmpty || senha.isEmpty){
      erro(context, 'Preencha todos os campos.');
      return;
    }
    
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushNamed(context, '/home');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // ESQUECEU A SENHA
  // Envia uma mensagem de email para recuperação de senha para
  // um conta de email válida
  //
  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      sucesso(context, 'Email enviado com sucesso.');
    } else {
      erro(context, 'Informe o email para recuperar a conta.');
    }
    Navigator.pop(context);
  }

  getUserId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  //
  // LOGOUT
  //
  logout() {
    FirebaseAuth.instance.signOut();
  }
}
