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
      appBar: AppBar(title: Text("Consulta Futebol"),),
      body: FutureBuilder(
        future: FutebolController.listarCampeonatos(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            //List<Campeonato> lisCamp = snapshot.data as List<Campeonato>;
            var listCampeonatos = snapshot.data as List<Campeonato>;
            return Container(
              height: 700,
              child: ListView.builder(
                  itemCount: listCampeonatos.length,
                  itemBuilder: (context, indice){
                    return Card(
                      child: ListTile(
                        title: Text(listCampeonatos[indice].nome+" "+listCampeonatos[indice].temporada),
                        subtitle: Text(listCampeonatos[indice].tipo),
                        leading: SizedBox(child: Image.network(listCampeonatos[indice].logo), width: 50),
                      ),
                    );
                  }),
            );
          } if(snapshot.hasError) {
            return Text("Deu Errado ");
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }

  Future<void> _refresh(){
    setState(){
      var futebol = FutebolController.listarCampeonatos();
    }

    return Future.delayed(Duration(seconds: 4));
  }
}
