import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipro_app/store/ministerio/ministerio.store.dart';
import 'package:ipro_app/widgets/button-grid-ministerio.widget.dart';
import 'package:mobx/mobx.dart';

class SelecionarMinisterioPage extends StatefulWidget {
  final String tag;
  final List selecionados;

  SelecionarMinisterioPage({
    @required this.tag,
    @required this.selecionados,
  });

  @override
  _SelecionarMinisterioPageState createState() =>
      _SelecionarMinisterioPageState();
}

class _SelecionarMinisterioPageState extends State<SelecionarMinisterioPage> {
  MinisterioStore _ministerioStore = MinisterioStore();
  List objs = [];
  @override
  void initState() {
    super.initState();
    if (widget.tag == 'ministerios') {
      _ministerioStore.pegarMinisterios();
    } else {
      _ministerioStore.pegarCursos();
    }
  }

  addObjeto() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(
          'SELECIONAR MINISTÉRIO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(widget.selecionados);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
                'Aqui você pode selecionar os ministério que você está trabalhando na nossa comunidade! Você pode selecionar mais de um ministério por vez!'),
          ),
          Observer(
            builder: (_) {
              if (!_ministerioStore.isLoading) {
                double height = 100;
                int contador = widget.tag == 'ministerios'
                    ? _ministerioStore.ministerios.length
                    : _ministerioStore.cursos.length;

                if (contador.isOdd) {
                  height *= (contador + 1);
                } else {
                  height *= contador;
                }

                if (contador == 0) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(
                      child: Text(' Sem ${widget.tag} para selecionar'),
                    ),
                  );
                }
                return Container(
                  height: height,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: contador,
                    itemBuilder: (context, index) {
                      dynamic elements = widget.tag == 'ministerios'
                          ? _ministerioStore.ministerios
                          : _ministerioStore.cursos;

                      bool slctd = false;

                      for (var selecionado in widget.selecionados) {
                        if (elements[index]?.id == selecionado.id) {
                          slctd = true;
                        }
                      }
                      return ButtonGridMinisterio(
                        objeto: widget.tag == 'ministerios'
                            ? _ministerioStore.ministerios[index]
                            : _ministerioStore.cursos[index],
                        selecionado: slctd,
                        adicionarObjeto: addObjeto,
                        objetosSelecionados: widget.selecionados,
                        index: index,
                      );
                    },
                  ),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pop(widget.selecionados);
          },
          color: Theme.of(context).accentColor,
          child: Center(
            child: Text(
              'Selecionar ${widget.tag}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
