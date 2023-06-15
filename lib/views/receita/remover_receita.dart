import 'package:ezprice/controller/receita_controller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoverReceitaScreen extends StatelessWidget {
  final String nomeReceita;

  const RemoverReceitaScreen({Key? key, required this.nomeReceita})
      : super(key: key);

  Future<void> _removerReceita(BuildContext context) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('receitas')
              .where('nome', isEqualTo: nomeReceita)
              .get();

      final List<DocumentSnapshot> documents = snapshot.docs;

      if (documents.isNotEmpty) {
        final DocumentSnapshot document = documents.first;

        // Chame o método excluir da classe ReceitaController
        ReceitaController().excluir(context, document.reference.id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Receita removida com sucesso')),
        );

        // Navegar de volta para a tela anterior
        Navigator.pop(context);
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao remover a receita')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remover Receita'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/gradMorpheu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tem certeza de que deseja remover a receita?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _removerReceita(context),
                child: Text('Remover'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
