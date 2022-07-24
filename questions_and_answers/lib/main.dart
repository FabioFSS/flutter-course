import 'package:questions_and_answers/questionario.dart';
import 'package:flutter/material.dart';
import 'package:questions_and_answers/resultado.dart';

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
      'respostas': [
        {'texto': 'Preto', 'nota': 1},
        {'texto': 'Vermelho', 'nota': 2},
        {'texto': 'Azul', 'nota': 3},
        {'texto': 'Verde', 'nota': 4},
      ],
    },
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Cachorro', 'nota': 1},
        {'texto': 'Gato', 'nota': 2},
        {'texto': 'Leão', 'nota': 3},
        {'texto': 'Elefante', 'nota': 4},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 1},
        {'texto': 'João', 'nota': 2},
        {'texto': 'Carlos', 'nota': 3},
        {'texto': 'Amanda', 'nota': 4},
      ],
    },
  ];
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas')),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciar: _reiniciar,
              ),
      ),
    );
  }
}
