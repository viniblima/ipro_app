import 'package:flutter/material.dart';
import 'package:ipro_app/pages/devocional.page.dart';
import 'package:ipro_app/pages/home.page.dart';
import 'package:ipro_app/pages/mais.page.dart';
import 'package:ipro_app/pages/perfil.page.dart';

class InitialTabs extends StatefulWidget {
  final int index;

  InitialTabs({this.index});

  @override
  _InitialTabsState createState() => _InitialTabsState();
}

class _InitialTabsState extends State<InitialTabs> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      _index = widget.index;
    }
  }

  List<BottomNavigationBarItem> _btnavigation = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.loyalty),
      title: Text('Descubra'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.format_list_bulleted),
      title: Text('Perfil'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('Mais'),
    ),
  ];

  static TextStyle _style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  List<Text> _titles = [
    Text(
      'HOME',
      style: _style,
    ),
    Text(
      'DESCUBRA',
      style: _style,
    ),
    Text(
      'COMANDAS',
      style: _style,
    ),
    Text(
      'PERFIL',
      style: _style,
    ),
  ];

  // Lista de páginas
  List<Widget> _pages = [
    HomePage(),
    DevocionalPage(),
    PerfilPage(),
    MaisPage(),
  ];

  void _navigate(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _index != 0
          ? AppBar(
              textTheme: Theme.of(context).textTheme,
              title: _titles.elementAt(_index),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            )
          : null,
      body: _pages.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        items: _btnavigation,
        currentIndex: _index,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _navigate,
        unselectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        selectedFontSize: 10,
      ),
    );
  }
}
