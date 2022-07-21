import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  PerguntaApp({Key? key}) : super(key: key);

  void responder() {
    debugPrint('Pergunta respondida!');
  }

  final List<String> perguntas = ['Qual seu nome?', 'Qual sua cor favorita?'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(children: [
          Text(perguntas[0]),
          ElevatedButton(onPressed: responder, child: const Text('resposta 1')),
          ElevatedButton(onPressed: responder, child: const Text('resposta 2')),
          ElevatedButton(onPressed: responder, child: const Text('resposta 3')),
        ]),
      ),
    );
  }
}
