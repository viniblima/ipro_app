import 'package:flutter/material.dart';

class ButtonGridMinisterio extends StatelessWidget {
  final objeto;
  bool selecionado = false;
  Function adicionarObjeto;
  List objetosSelecionados;

  ButtonGridMinisterio({
    @required this.objeto,
    @required this.selecionado,
    @required this.adicionarObjeto,
    @required this.objetosSelecionados,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      height: 100,
      margin: EdgeInsets.all(4),
      child: RaisedButton(
        onPressed: () {
          if (!selecionado) {
            objetosSelecionados.add(objeto);
          } else {
            int index = 0;
            objetosSelecionados.asMap().forEach((key, value) { 
              if(value == objeto){
                index = key;
              }
            });

            objetosSelecionados.removeAt(index);
          }
          adicionarObjeto();
        },
        color: selecionado ? Theme.of(context).accentColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Theme.of(context).accentColor,
            width: 3,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                objeto.nome,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selecionado
                      ? Colors.white
                      : Theme.of(context).accentColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                ),
                child: selecionado
                    ? Icon(
                        Icons.done_all,
                        color: Colors.white,
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
