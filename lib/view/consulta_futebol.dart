import 'package:app_apis/model/campeonato.dart';
import 'package:flutter/material.dart';

import '../controller/futebol_controller.dart';

class ConsultaFutebol extends StatefulWidget {
  const ConsultaFutebol({Key? key}) : super(key: key);

  @override
  State<ConsultaFutebol> createState() => _ConsultaFutebolState();
}

class _ConsultaFutebolState extends State<ConsultaFutebol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consulta Futebol"),),
      body: FutureBuilder(
        future: FutebolController.listarCampeonatos(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            //List<Campeonato> lisCamp = snapshot.data as List<Campeonato>;
            var listCampeonatos = snapshot.data as List<Campeonato>;
            return SizedBox(
              height: 700,
              child: ListView.builder(
                  itemCount: listCampeonatos.length,
                  itemBuilder: (context, indice){
                    return Card(
                      child: ListTile(
                        title: Text("${listCampeonatos[indice].nome} ${listCampeonatos[indice].temporada}"),
                        subtitle: Text(listCampeonatos[indice].tipo),
                        leading: SizedBox(width: 50, child: Image.network(listCampeonatos[indice].logo)),
                      ),
                    );
                  }),
            );
          } if(snapshot.hasError) {
            return const Text("Deu Errado ");
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }

}
