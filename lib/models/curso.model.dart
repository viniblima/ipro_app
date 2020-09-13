class Curso {
  String id;
  String nome;

  Curso({
    this.id,
    this.nome,
  });

  Curso.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }
}
