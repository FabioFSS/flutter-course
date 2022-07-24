import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({Key? key, required this.pontuacao, required this.reiniciar})
      : super(key: key);

  final int pontuacao;
  final void Function() reiniciar;

  String get fraseResultado {
    if (pontuacao > 5) {
      return 'Parabéns!';
    } else {
      return 'Que pena...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
          Text(
            "Sua pontuação foi: $pontuacao",
            style: const TextStyle(fontSize: 28),
          ),
          ElevatedButton(
            onPressed: reiniciar,
            child: const Text(
              "Reiniciar",
            ),
          )
        ],
      ),
    );
  }
}
