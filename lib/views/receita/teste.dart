import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Itens"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('ingredientes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("Nenhum item encontrado."),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var item = snapshot.data!.docs[index];
              var nomeItem = item['ingrediente'] ?? 'Sem nome'; // Supondo que 'nome' é um campo no documento

              // O widget ListTile é útil para criar um layout de lista padronizado com um ícone à esquerda (checkbox no nosso caso).
              return ListTile(
                leading: Checkbox(
                  value: false, // Defina o valor do checkbox conforme sua lógica
                  onChanged: (value) {
                    // Aqui você pode adicionar a lógica para tratar a mudança do valor do checkbox
                  },
                ),
                title: Text(nomeItem),
              );
            },
          );
        },
      ),
    );
  }
}
