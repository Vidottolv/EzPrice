// ignore_for_file: non_constant_identifier_names

class ReceitaCadastro {
  final String nomeReceita;
  final String ingred1;
  final String ingred2;
  final String ingred3;
  final String ingred4;
  final String ingred5;
  final String ingred6;
  final String ingred7;
  final String ingred8;
  final String ingred9;
  final String ingred10;
  final String ingred11;
  final String ingred12;
  final String ingred13;
  final String ingred14;
  final String ingred15;
  final String ingred16;
  final String ingred17;
  final String ingred18;
  final String ingred19;
  final String ingred20;
  final double PrecoIngred1;
  final double PrecoIngred2;
  final double PrecoIngred3;
  final double PrecoIngred4;
  final double PrecoIngred5;
  final double PrecoIngred6;
  final double PrecoIngred7;
  final double PrecoIngred8;
  final double PrecoIngred9;
  final double PrecoIngred10;
  final double PrecoIngred11;
  final double PrecoIngred12;
  final double PrecoIngred13;
  final double PrecoIngred14;
  final double PrecoIngred15;
  final double PrecoIngred16;
  final double PrecoIngred17;
  final double PrecoIngred18;
  final double PrecoIngred19;
  final double PrecoIngred20;
  final double QTDIngred1;
  final double QTDIngred2;
  final double QTDIngred3;
  final double QTDIngred4;
  final double QTDIngred5;
  final double QTDIngred6;
  final double QTDIngred7;
  final double QTDIngred8;
  final double QTDIngred9;
  final double QTDIngred10;
  final double QTDIngred11;
  final double QTDIngred12;
  final double QTDIngred13;
  final double QTDIngred14;
  final double QTDIngred15;
  final double QTDIngred16;
  final double QTDIngred17;
  final double QTDIngred18;
  final double QTDIngred19;
  final double QTDIngred20;
  final double tempoDeGas;
  final double idReceita;
  final double lucro;

  ReceitaCadastro(
    this.nomeReceita,
    this.tempoDeGas,
    this.idReceita,
    this.lucro,
    this.ingred1,
    this.ingred2,
    this.ingred3,
    this.ingred4,
    this.ingred5,
    this.ingred6,
    this.ingred7,
    this.ingred8,
    this.ingred9,
    this.ingred10,
    this.ingred11,
    this.ingred12,
    this.ingred13,
    this.ingred14,
    this.ingred15,
    this.ingred16,
    this.ingred17,
    this.ingred18,
    this.ingred19,
    this.ingred20,
    this.PrecoIngred1,
    this.PrecoIngred2,
    this.PrecoIngred3,
    this.PrecoIngred4,
    this.PrecoIngred5,
    this.PrecoIngred6,
    this.PrecoIngred7,
    this.PrecoIngred8,
    this.PrecoIngred9,
    this.PrecoIngred10,
    this.PrecoIngred11,
    this.PrecoIngred12,
    this.PrecoIngred13,
    this.PrecoIngred14,
    this.PrecoIngred15,
    this.PrecoIngred16,
    this.PrecoIngred17,
    this.PrecoIngred18,
    this.PrecoIngred19,
    this.PrecoIngred20,
    this.QTDIngred1,
    this.QTDIngred2,
    this.QTDIngred3,
    this.QTDIngred4,
    this.QTDIngred5,
    this.QTDIngred6,
    this.QTDIngred7,
    this.QTDIngred8,
    this.QTDIngred9,
    this.QTDIngred10,
    this.QTDIngred11,
    this.QTDIngred12,
    this.QTDIngred13,
    this.QTDIngred14,
    this.QTDIngred15,
    this.QTDIngred16,
    this.QTDIngred17,
    this.QTDIngred18,
    this.QTDIngred19,
    this.QTDIngred20,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nomeReceita': nomeReceita,
      'tempoDeGas': tempoDeGas,
      'idReceita': idReceita,
      'lucro': lucro,
      'ingred1': ingred1,
      'ingred2': ingred2,
      'ingred3': ingred3,
      'ingred4': ingred4,
      'ingred5': ingred5,
      'ingred6': ingred6,
      'ingred7': ingred7,
      'ingred8': ingred8,
      'ingred9': ingred9,
      'ingred10': ingred10,
      'ingred11': ingred11,
      'ingred12': ingred12,
      'ingred13': ingred13,
      'ingred14': ingred14,
      'ingred15': ingred15,
      'ingred16': ingred16,
      'ingred17': ingred17,
      'ingred18': ingred18,
      'ingred19': ingred19,
      'ingred20': ingred20,
      'PrecoIngred1': PrecoIngred1,
      'PrecoIngred2': PrecoIngred2,
      'PrecoIngred3': PrecoIngred3,
      'PrecoIngred4': PrecoIngred4,
      'PrecoIngred5': PrecoIngred5,
      'PrecoIngred6': PrecoIngred6,
      'PrecoIngred7': PrecoIngred7,
      'PrecoIngred8': PrecoIngred8,
      'PrecoIngred9': PrecoIngred9,
      'PrecoIngred10': PrecoIngred10,
      'PrecoIngred11': PrecoIngred11,
      'PrecoIngred12': PrecoIngred12,
      'PrecoIngred13': PrecoIngred13,
      'PrecoIngred14': PrecoIngred14,
      'PrecoIngred15': PrecoIngred15,
      'PrecoIngred16': PrecoIngred16,
      'PrecoIngred17': PrecoIngred17,
      'PrecoIngred18': PrecoIngred18,
      'PrecoIngred19': PrecoIngred19,
      'PrecoIngred20': PrecoIngred20,
      'QTDIngred1': QTDIngred1,
      'QTDIngred2': QTDIngred2,
      'QTDIngred3': QTDIngred3,
      'QTDIngred4': QTDIngred4,
      'QTDIngred5': QTDIngred5,
      'QTDIngred6': QTDIngred6,
      'QTDIngred7': QTDIngred7,
      'QTDIngred8': QTDIngred8,
      'QTDIngred9': QTDIngred9,
      'QTDIngred10': QTDIngred10,
      'QTDIngred11': QTDIngred11,
      'QTDIngred12': QTDIngred12,
      'QTDIngred13': QTDIngred13,
      'QTDIngred14': QTDIngred14,
      'QTDIngred15': QTDIngred15,
      'QTDIngred16': QTDIngred16,
      'QTDIngred17': QTDIngred17,
      'QTDIngred18': QTDIngred18,
      'QTDIngred19': QTDIngred19,
      'QTDIngred20': QTDIngred20,
    };
  }

  factory ReceitaCadastro.fromJson(Map<String, dynamic> json) {
    return ReceitaCadastro(
      json['nomeReceita'],
      json['tempoDeGas'],
      json['idReceita'],
      json['lucro'],
      json['ingred1'],
      json['ingred2'],
      json['ingred3'],
      json['ingred4'],
      json['ingred5'],
      json['ingred6'],
      json['ingred7'],
      json['ingred8'],
      json['ingred9'],
      json['ingred10'],
      json['ingred11'],
      json['ingred12'],
      json['ingred13'],
      json['ingred14'],
      json['ingred15'],
      json['ingred16'],
      json['ingred17'],
      json['ingred18'],
      json['ingred19'],
      json['ingred20'],
      json['PrecoIngred1'],
      json['PrecoIngred2'],
      json['PrecoIngred3'],
      json['PrecoIngred4'],
      json['PrecoIngred5'],
      json['PrecoIngred6'],
      json['PrecoIngred7'],
      json['PrecoIngred8'],
      json['PrecoIngred9'],
      json['PrecoIngred10'],
      json['PrecoIngred11'],
      json['PrecoIngred12'],
      json['PrecoIngred13'],
      json['PrecoIngred14'],
      json['PrecoIngred15'],
      json['PrecoIngred16'],
      json['PrecoIngred17'],
      json['PrecoIngred18'],
      json['PrecoIngred19'],
      json['PrecoIngred20'],
      json['QTDIngred1'],
      json['QTDIngred2'],
      json['QTDIngred3'],
      json['QTDIngred4'],
      json['QTDIngred5'],
      json['QTDIngred6'],
      json['QTDIngred7'],
      json['QTDIngred8'],
      json['QTDIngred9'],
      json['QTDIngred10'],
      json['QTDIngred11'],
      json['QTDIngred12'],
      json['QTDIngred13'],
      json['QTDIngred14'],
      json['QTDIngred15'],
      json['QTDIngred16'],
      json['QTDIngred17'],
      json['QTDIngred18'],
      json['QTDIngred19'],
      json['QTDIngred20'],
    );
  }
}
