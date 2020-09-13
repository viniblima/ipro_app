class Ministerio {
  String id;
  String nome;

  Ministerio({
    this.id,
    this.nome,
  });

  Ministerio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }
}
