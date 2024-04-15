class Usuario {
  String? matricula;
  String? nome;
  String? email;
  String? telefone;
  
  Usuario({
    this.matricula,
    this.nome,
    this.email,
    this.telefone
  });

  Map<String, dynamic> toFirestore(){
    return{
      if (matricula != null) "matricula": matricula,
      if (nome != null) "nome": nome,
      if(email != null) "email": email,
      if(telefone != null) "telefone": telefone
    };
  }

}