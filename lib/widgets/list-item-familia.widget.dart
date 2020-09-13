import 'package:flutter/material.dart';
import 'package:ipro_app/models/familia.model.dart';

class ListItemFamilia extends StatelessWidget {
  final Familia familia;

  ListItemFamilia({
    @required this.familia,
  });

  @override
  Widget build(BuildContext context) {
    final List integrantes =
        Iterable<int>.generate(familia.integrantes.length).toList();

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop(familia);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).accentColor,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        familia.nome,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 4,
                      ),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                          children: integrantes.length == 0
                              ? [
                                  TextSpan(
                                    text: 'Sem usuários associados',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ]
                              : integrantes.map(
                                  (index) {
                                    print(index);
                                    print(integrantes.length);
                                    return TextSpan(
                                      text:
                                          '${familia.integrantes[index]}${integrantes.length == index + 1 ? '. ' : ', '}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    );
                                  },
                                ).toList(),
                          // text: '$nomeEmpresa',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Icon(
                  Icons.done_all,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
