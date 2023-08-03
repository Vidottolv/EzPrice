class Ingrediente {
  final String ingrediente;
  final double preco;
  final String uid;
  final String unidadeMedida;
  final String idIngrediente;

  Ingrediente(
    this.ingrediente, 
    this.preco, 
    this.uid, 
    this.unidadeMedida,
    this.idIngrediente);

  Map<String, dynamic> toJson() {
    return {
      'ingrediente': ingrediente,
      'preco': preco,
      'uid': uid,
      'unidadeMedida': unidadeMedida,
      'idIngrediente': idIngrediente,
    };
  }

  factory Ingrediente.fromJson(Map<String, dynamic> json) {
    return Ingrediente(
      json['ingrediente'], 
      json['preco'],
      json['uid'],
      json['unidadeMedida'],
      json['idIngrediente']);
  }
}
