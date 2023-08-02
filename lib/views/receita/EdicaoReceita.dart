// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:ezprice/model/model_receita.dart';
import 'package:ezprice/views/components/rounded_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../controller/receita_controller.dart';
import '../../model/ingrediente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EdicaoReceita extends StatefulWidget {
  final String idReceita;

  EdicaoReceita({required this.idReceita});

  @override
  State<EdicaoReceita> createState() => _EdicaoReceitaState();
}

class _EdicaoReceitaState extends State<EdicaoReceita> {
  List<Ingrediente> ingredientesList = [];
  bool isLoading = false;
  late ReceitaCadastro receitaSalva =
      ReceitaCadastro('', 0.0, '', '', 0.0, [], 0.0, '', 0);
  String nomeReceita = '';
  String rendimento = '';
  String lucro = '';
  String gas = '';
  String precoVenda = '';
  int contador = 0;

  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchReceita();
  }

  void fetchReceita() async {
    setState(() {
      isLoading = true;
    });

    try {
      DocumentSnapshot docSnapshot =
          await firestore.collection('receitas').doc(widget.idReceita).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        receitaSalva = ReceitaCadastro.fromJson(data);

        setState(() {
          nomeReceita = receitaSalva.nomeReceita;
          rendimento = receitaSalva.rendimento;
          lucro = receitaSalva.lucro.toString();
          gas = receitaSalva.tempoDeGas.toString();
          // Outros campos que você precisa atualizar
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Receita não encontrada');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Erro ao carregar os dados da receita: $e');
    }
  }

  void atualizar() {
    var uuid = const Uuid();

    ReceitaCadastro receitaA = ReceitaCadastro(
      nomeReceita,
      double.parse(gas),
      rendimento,
      uid,
      double.parse(lucro),
      ingredientesList,
      double.parse(precoVenda),
      uuid.v4(),
      contador
    );
    ReceitaController().atualizar(context, widget.idReceita, receitaA);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EzPrice"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: atualizar,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/gradMorpheu.png'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: ListView(
                children: [
                  Text(
                    'Nome inicial: ${receitaSalva.nomeReceita}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  RoundedTextField(
                    labelText: 'Nome da Receita',
                    hintText: '',
                    icon: Icons.local_cafe,
                    controller: TextEditingController(text: nomeReceita),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rendimento inicial: ${receitaSalva.rendimento}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  RoundedTextField(
                    labelText: 'Rendimento da Receita',
                    hintText: '',
                    icon: Icons.shopping_basket,
                    controller: TextEditingController(text: rendimento),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lucro inicial: $lucro',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  RoundedTextField(
                    labelText: 'Lucro Percentual',
                    hintText: '',
                    icon: Icons.monetization_on,
                    controller: TextEditingController(text: lucro),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Tempo de Gás inicial: $gas',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  RoundedTextField(
                    labelText: 'Tempo de Gás',
                    hintText: '',
                    icon: Icons.local_gas_station,
                    controller: TextEditingController(text: gas),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ingredientes:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Restante dos componentes da tela
                ],
              ),
            ),
    );
  }
}
