import 'package:app_apis/view/consulta_cep.dart';
import 'package:app_apis/view/consulta_futebol.dart';
import 'package:app_apis/view/home.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(_)=>const Home(),
        "/cep":(_)=>const ConsultaCep(),
        "/futebol":(_)=>const ConsultaFutebol(),
      },
  ),);
}
