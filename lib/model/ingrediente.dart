class Ingrediente {
  final String nomeReceita;
  final int quantidade;
  final int preco;

  Ingrediente(this.nomeReceita, this.quantidade, this.preco);

  Map<String, dynamic> toJson() {
    return {
      'nomeReceita': nomeReceita,
      'quantidade': quantidade,
      'preco': preco,
    };
  }

  factory Ingrediente.fromJson(Map<String, dynamic> json) {
    return Ingrediente(json['nomeReceita'], json['quantidade'], json['preco']);
  }
}
