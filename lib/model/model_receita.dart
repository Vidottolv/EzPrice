class ReceitaCadastro {
  final String nomeReceita;
  final String ingrediente;
  final double preco;
  final double quantidade;
  final double tempoDeGas;
  final String uid;
  final double lucro;
  final double precoVenda;

  ReceitaCadastro(
    this.nomeReceita,
    this.tempoDeGas,
    this.uid,
    this.lucro,
    this.ingrediente,
    this.preco,
    this.quantidade,
    this.precoVenda,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nomeReceita': nomeReceita,
      'tempoDeGas': tempoDeGas,
      'uid': uid,
      'lucro': lucro,
      'ingrediente': ingrediente,
      'preco': preco,
      'quantidade': quantidade,
      'precoVenda': precoVenda,
    };
  }

  factory ReceitaCadastro.fromJson(Map<String, dynamic> json) {
    return ReceitaCadastro(
      json['nomeReceita'],
      json['tempoDeGas'],
      json['uid'],
      json['lucro'],
      json['ingrediente'],
      json['preco'],
      json['quantidade'],
      json['precoVenda'],
    );
  }
}
