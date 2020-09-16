import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ipro_app/pages/cadastro-outras-informacoes.page.dart';
import 'package:ipro_app/util/slide-route.dart';
import 'package:ipro_app/widgets/alert.dart';
import 'dart:math' as math;

import 'package:ipro_app/widgets/input-field-cadastro.widget.dart';
import 'package:intl/intl.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  Alert alert = Alert();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        leading: Transform.rotate(
          angle: 270 * math.pi / 180,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
        title: Text(
          'CADASTRO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                  ),
                  child: InputFieldCadastro(
                    controller: nomeController,
                    label: 'Nome',
                    typeKeyboard: TextInputType.text,
                    isPassword: false,
                    validatorEmpty: true,
                    enabled: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                  ),
                  child: InputFieldCadastro(
                    controller: emailController,
                    label: 'Email',
                    typeKeyboard: TextInputType.emailAddress,
                    isPassword: false,
                    validatorEmpty: true,
                    enabled: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                  ),
                  child: InputFieldCadastro(
                    controller: senhaController,
                    label: 'Senha',
                    typeKeyboard: TextInputType.text,
                    isPassword: true,
                    validatorEmpty: true,
                    enabled: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                  ),
                  child: InputFieldCadastro(
                    controller: confirmarSenhaController,
                    label: 'Confirmar senha',
                    typeKeyboard: TextInputType.text,
                    isPassword: true,
                    validatorEmpty: true,
                    enabled: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      locale: LocaleType.pt,
                      currentTime: DateTime.now(),
                      minTime: DateTime(1920),
                      theme: DatePickerTheme(
                        cancelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        doneStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      maxTime: DateTime.now(),
                      onConfirm: (time) {
                        FocusScope.of(context).unfocus();
                        setState(
                          () {
                            DateFormat('dd/MM').format(time);
                            dataController.text =
                                "${DateFormat('dd/MM/yyyy').format(time)}";
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 24,
                    ),
                    child: InputFieldCadastro(
                      controller: dataController,
                      label: 'Data de nascimento',
                      typeKeyboard: TextInputType.emailAddress,
                      isPassword: false,
                      validatorEmpty: true,
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: 100,
          child: Center(
            child: InkWell(
              onTap: () {
                if (nomeController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    dataController.text.isEmpty ||
                    senhaController.text.isEmpty ||
                    confirmarSenhaController.text.isEmpty) {
                  alert.dialog(
                    'Opa! Precisamos de todos os dados!',
                    'Verifique os campos e tente novamente',
                    context,
                  );
                  return;
                }

                if (senhaController.text != confirmarSenhaController.text) {
                  alert.dialog(
                    'Opa! As senhas não coincidem!',
                    'Verifique os campos e tente novamente',
                    context,
                  );
                  return;
                }

                Navigator.push(
                  context,
                  SlideRightRoute(
                    offset: Offset(1, 0),
                    page: CadastroOutrasInformacoesPage(
                      nome: nomeController.text,
                      email: emailController.text,
                      dataNascimento: dataController.text,
                      senha: senhaController.text,
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 50,
                width: 50,
                child: Container(
                  child: Center(
                    child: Icon(Icons.arrow_forward),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
