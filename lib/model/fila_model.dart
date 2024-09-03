class FilaConsulta {
  final String ficha;
  final int pessoasEsperando;
  final int tempoEstimado;

  FilaConsulta({required this.ficha, required this.pessoasEsperando, required this.tempoEstimado});

  factory FilaConsulta.fromMap(Map<String, dynamic> data) {
    return FilaConsulta(
      ficha: data['ficha'] ?? 'N/A',
      pessoasEsperando: data['pessoasEsperando'] ?? 0,
      tempoEstimado: data['tempoEstimado'] ?? 0,
    );
  }
}
