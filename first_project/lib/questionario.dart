import 'package:first_project/questao.dart';
import 'package:first_project/resposta.dart';
import "package:flutter/material.dart";

class Questionario extends StatelessWidget {
  const Questionario(
      {Key? key,
      required this.perguntas,
      required this.responder,
      required this.perguntaSelecionada})
      : super(key: key);

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> stringRespostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(children: [
      Questao(
        texto: perguntas[perguntaSelecionada]['texto'].toString(),
      ),
      ...stringRespostas
          .map((texto) => Resposta(
              texto: texto['texto'].toString(),
              onSelecao: () => responder(int.parse(texto['nota'].toString()))))
          .toList(),
    ]);
  }
}
