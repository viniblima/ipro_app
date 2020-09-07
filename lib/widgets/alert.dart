import 'package:flutter/material.dart';

class Alert {

    Future<void> dialog(String titulo, String subtitulo, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(subtitulo),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}