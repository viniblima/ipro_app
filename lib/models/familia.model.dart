class Familia {
  String id;
  String nome;
  List<String> integrantes;

  Familia({
    this.id,
    this.nome,
    this.integrantes,
  });

  Familia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    integrantes = pegarIntegrantes(json);
  }

  pegarIntegrantes(Map<String, dynamic> json){

    List<String> integrantes = [];

    for(Map<String, dynamic> integrante in json['integrantes']){
      integrantes.add(integrante['user_nome']);
    }

    return integrantes;
  }
}
