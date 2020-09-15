import 'package:flutter/material.dart';

class MinisterioSelecionadoGridWidget extends StatelessWidget {
  final dynamic objetoSelecionado;

  MinisterioSelecionadoGridWidget({
    @required this.objetoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Center(
        child: Text(
          objetoSelecionado.nome,
        ),
      ),
    );
  }
}
