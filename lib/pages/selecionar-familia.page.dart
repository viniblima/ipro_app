import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipro_app/models/familia.model.dart';
import 'package:ipro_app/store/usuario/usuario.store.dart';
import 'package:ipro_app/util/slide-route.dart';
import 'package:ipro_app/widgets/list-item-familia.widget.dart';

import 'adicionar-familia.page.dart';

class SelecionarFamiliaPage extends StatefulWidget {
  final Familia familia;

  SelecionarFamiliaPage({
    this.familia,
  });
  @override
  _SelecionarFamiliaPageState createState() => _SelecionarFamiliaPageState();
}

class _SelecionarFamiliaPageState extends State<SelecionarFamiliaPage> {
  UsuarioStore _usuarioStore = UsuarioStore();

  @override
  void initState() {
    super.initState();
    _usuarioStore.pegarFamilias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(
          'SELECIONAR FAMÍLIA',
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
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).accentColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                SlideRightRoute(
                  page: AdicionarFamiliaPage(),
                  offset: Offset(0, 1),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Observer(
          builder: (_) {
            if (_usuarioStore.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Aqui você pode selecionar sua família nessa lista! Não achou? Só clicar ali em cima para criar e adicionar a sua família!',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _usuarioStore.familias.length,
                        itemBuilder: (context, index) {
                          return ListItemFamilia(
                            familia: _usuarioStore.familias[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
