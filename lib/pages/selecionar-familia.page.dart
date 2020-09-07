import 'package:flutter/material.dart';
import 'package:ipro_app/util/slide-route.dart';

import 'adicionar-familia.page.dart';

class SelecionarFamiliaPage extends StatefulWidget {
  @override
  _SelecionarFamiliaPageState createState() => _SelecionarFamiliaPageState();
}

class _SelecionarFamiliaPageState extends State<SelecionarFamiliaPage> {
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
      ),
    );
  }
}
