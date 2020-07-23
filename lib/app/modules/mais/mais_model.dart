import 'dart:convert';

class MaisModel {
  MaisModel({
    this.quantidade,
    this.medicamento,
  });

  int quantidade;
  Medicamento medicamento;

  MaisModel copyWith({
    int quantidade,
    Medicamento medicamento,
  }) =>
      MaisModel(
        quantidade: quantidade ?? this.quantidade,
        medicamento: medicamento ?? this.medicamento,
      );

  factory MaisModel.fromRawJson(String str) =>
      MaisModel.fromMap(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaisModel.fromMap(Map<String, dynamic> json) => MaisModel(
        quantidade: json["quantidade"],
        medicamento: Medicamento.fromMap(json["medicamento"]),
      );

  Map<String, dynamic> toJson() => {
        "quantidade": quantidade,
        "medicamento": medicamento.toJson(),
      };

  static List<MaisModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<MaisModel>((item) => MaisModel.fromMap(item)).toList();
  }
}

class Medicamento {
  Medicamento({
    this.apresentacao,
    this.classeId,
    this.nome,
  });

  String apresentacao;
  int classeId;
  String nome;

  Medicamento copyWith({
    String apresentacao,
    int classeId,
    String nome,
  }) =>
      Medicamento(
        apresentacao: apresentacao ?? this.apresentacao,
        classeId: classeId ?? this.classeId,
        nome: nome ?? this.nome,
      );

  factory Medicamento.fromRawJson(String str) =>
      Medicamento.fromMap(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Medicamento.fromMap(Map<String, dynamic> json) => Medicamento(
        apresentacao: json["apresentacao"],
        classeId: json["classe_id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "apresentacao": apresentacao,
        "classe_id": classeId,
        "nome": nome,
      };
}
