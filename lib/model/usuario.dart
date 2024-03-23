class Usuario {
  String matricula;
  String nome;
  String email;
  String telefone;
  String senha;

  Usuario({
    required this.matricula,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'matricula': matricula,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
  }
}
