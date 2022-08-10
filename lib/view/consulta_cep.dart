import 'package:flutter/material.dart';

const titulo = "Consultar CEP";
const txBotao = "Chegou no CEP";

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({Key? key}) : super(key: key);

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(titulo),),
      body: Container(color: Colors.white,child: const Text(txBotao)),
    );
  }
}
