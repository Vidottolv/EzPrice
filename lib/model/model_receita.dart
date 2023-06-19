import 'package:ezprice/model/ingrediente.dart';

class ReceitaCadastro {
  final String nomeReceita;
  final List<Ingrediente> ingrediente;
  final double tempoDeGas;
  final String rendimento;
  final String uid;
  final double lucro;
  final double precoVenda;
  final String idReceita;

  ReceitaCadastro(
    this.nomeReceita,
    this.tempoDeGas,
    this.rendimento,
    this.uid,
    this.lucro,
    this.ingrediente,
    this.precoVenda,
    this.idReceita,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nomeReceita': nomeReceita,
      'tempoDeGas': tempoDeGas,
      'rendimento': rendimento,
      'uid': uid,
      'lucro': lucro,
      'ingrediente': ingrediente.map((ingred) => ingred.toJson()).toList(),
      'precoVenda': precoVenda,
      'idReceita': idReceita,
    };
  }

  factory ReceitaCadastro.fromJson(Map<String, dynamic> json) {
    return ReceitaCadastro(
      json['nomeReceita'],
      json['tempoDeGas'],
      json['rendimento'],
      json['uid'],
      json['lucro'],
      (json['ingrediente'] as List<dynamic>)
          .map((ingredJson) => Ingrediente.fromJson(ingredJson))
          .toList(),
      json['precoVenda'],
      json['idReceita'],
    );
  }
}
