import 'dart:convert';

class ImovelModel {
  final int id;
  final String titulo;
  final String descricao;
  final String tipo;
  final double preco;
  final String cidade;
  final String bairro;
  final int quartos;
  final int banheiros;
  final int vagas;
  final double area;
  final String foto;

  ImovelModel(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.tipo,
      required this.preco,
      required this.cidade,
      required this.bairro,
      required this.quartos,
      required this.banheiros,
      required this.vagas,
      required this.area,
      required this.foto});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'tipo': tipo,
      'preco': preco,
      'cidade': cidade,
      'bairro': bairro,
      'quartos': quartos,
      'banheiros': banheiros,
      'vagas': vagas,
      'area': area,
      'foto': foto,
    };
  }

  factory ImovelModel.fromMap(Map<String, dynamic> map) {
    return ImovelModel(
      id: map['id']?.toInt() ?? 0,
      titulo: map['titulo'] ?? '',
      descricao: map['descricao'] ?? '',
      tipo: map['tipo'] ?? '',
      preco: map['preco']?.toDouble() ?? 0.0,
      cidade: map['cidade'] ?? '',
      bairro: map['bairro'] ?? '',
      quartos: map['quartos']?.toInt() ?? 0,
      banheiros: map['banheiros']?.toInt() ?? 0,
      vagas: map['vagas']?.toInt() ?? 0,
      area: map['area']?.toDouble() ?? 0.0,
      foto: map['foto'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImovelModel.fromJson(String source) => ImovelModel.fromMap(json.decode(source));
}
