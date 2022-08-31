import 'package:app_apis/model/campeonato.dart';
import 'package:dio/dio.dart';

class FutebolController {

  static Future listarCampeonatos() async {

      var dio = Dio();
      dio.options.headers["authorization"]="Bearer test_8c305c462778b99ce57d5f497c394c";
      //dio.options.headers["authorization"]="Bearer live_8c8abcc55969870eb6fd3130e22f89";
      var response = await dio.get('https://api.api-futebol.com.br/v1/campeonatos');

      List dados = response.data;
      List<Campeonato> listaCampeonatos = [];

      for (var dado in dados){
        String nome  = dado["nome"];
        String temporada = dado["edicao_atual"]["temporada"];
        String tipo = dado["fase_atual"]["tipo"];
        String logo = dado["logo"];
        var campeonato = Campeonato(nome, temporada, tipo, logo);
        listaCampeonatos.add(campeonato);
      }
     print(listaCampeonatos.toString());

      return listaCampeonatos;
  }


}