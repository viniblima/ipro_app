import 'package:flutter/material.dart';

class InputFieldCadastro extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool onFocus = false;
  bool enabled = false;
  final TextInputType typeKeyboard;
  final bool isPassword;
  final bool validatorEmpty;

  InputFieldCadastro({
    @required this.controller,
    @required this.label,
    @required this.typeKeyboard,
    @required this.isPassword,
    @required this.validatorEmpty,
    @required this.enabled,
  });

  @override
  _InputFieldCadastroState createState() => _InputFieldCadastroState();
}

class _InputFieldCadastroState extends State<InputFieldCadastro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        enabled: widget.enabled,
        keyboardType: widget.typeKeyboard,
        validator: (String value) {
          if (value.isEmpty && widget.validatorEmpty) {
            return 'Este campo é necessário';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: widget.label,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          contentPadding: EdgeInsets.only(
            left: 8,
            bottom: 8,
          ),
          labelStyle: TextStyle(
            color: widget.onFocus || widget.controller.text.isNotEmpty
                ? Theme.of(context).accentColor
                : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
