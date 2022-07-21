import 'package:flutter/material.dart';
import 'package:first_project/questao.dart';
import 'package:first_project/resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Azul', 'Verde'],
    },
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Cachorro', 'Gato', 'Cobra', 'Elefante'],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Carlos', 'Pedro'],
    },
  ];
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      if (temPerguntaSelecionada) _perguntaSelecionada++;
    });
    debugPrint('$_perguntaSelecionada');
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> stringRespostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas')),
        ),
        body: temPerguntaSelecionada
            ? Column(children: [
                Questao(
                  texto: _perguntas[_perguntaSelecionada]['texto'].toString(),
                ),
                ...stringRespostas
                    .map((texto) =>
                        Resposta(texto: texto, onSelecao: _responder))
                    .toList(),
              ])
            : const Center(
                child: Text(
                  "Parabéns",
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}
