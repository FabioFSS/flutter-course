import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta({Key? key, required this.texto, required this.onSelecao})
      : super(key: key);

  final String texto;
  final void Function() onSelecao;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelecao,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        child: Text(texto),
      ),
    );
  }
}
