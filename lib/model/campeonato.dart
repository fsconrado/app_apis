class Campeonato {

  final String nome;
  final String temporada;
  final String tipo;
  final String logo;

  Campeonato(this.nome, this.temporada, this.tipo, this.logo);

  @override
  String toString() {
    // TODO: implement toString
    return "Nome $nome, temporada: $temporada, tipo: $tipo, logo: $logo";
  }

}