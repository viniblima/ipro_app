import 'package:flutter/material.dart';

class ButtonGridMinisterio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      height: 60,
      margin: EdgeInsets.all(4),
      child: RaisedButton(
        onPressed: () {},
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
