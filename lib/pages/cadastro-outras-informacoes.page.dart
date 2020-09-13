import 'package:flutter/material.dart';
import 'package:ipro_app/pages/selecionar-familia.page.dart';
import 'package:ipro_app/util/slide-route.dart';
import 'package:ipro_app/widgets/input-field-cadastro.widget.dart';

class CadastroOutrasInformacoesPage extends StatefulWidget {
  final String nome;
  final String email;
  final String dataNascimento;

  CadastroOutrasInformacoesPage({
    @required this.nome,
    @required this.email,
    @required this.dataNascimento,
  });

  @override
  _CadastroOutrasInformacoesPageState createState() =>
      _CadastroOutrasInformacoesPageState();
}

class _CadastroOutrasInformacoesPageState
    extends State<CadastroOutrasInformacoesPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController familiaController = TextEditingController();

  Map objNavigation = {
    "familia": null,
    "ministerios": [],
    "cursos": [],
  };

  _navigateWithParams(BuildContext context, Widget page, obj) async {
    var paramsEdited = await Navigator.push(
      context,
      SlideRightRoute(
        page: page,
        offset: Offset(0, 1),
      ),
    );
    objNavigation[obj] = paramsEdited;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (objNavigation['familia'] != null) {
      familiaController.text = objNavigation['familia'].nome;
    }
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).accentColor,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  'Pertence à uma família da igreja? Nos informe aqui!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _navigateWithParams(
                    context,
                    SelecionarFamiliaPage(),
                    'familia',
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 24,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: InputFieldCadastro(
                    controller: familiaController,
                    label: 'Família',
                    typeKeyboard: TextInputType.text,
                    isPassword: false,
                    validatorEmpty: false,
                    enabled: false,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 48,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  'Faz parte de algum ministério? Fez algum de nossos cursos? Nos deixe saber aqui embaixo',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                  left: 24,
                  right: 24,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                height: 32,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ministérios',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: InkWell(
                        onTap: () {
                          _navigateWithParams(
                            context,
                            SelecionarFamiliaPage(),
                            'ministerios',
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Adicionar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: objNavigation['ministerios'].length > 0
                    ? Container()
                    : Container(
                        height: 128,
                        margin: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        child: Text(
                          'Nenhum ministério selecionado',
                        ),
                      ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 48,
                  left: 24,
                  right: 24,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                height: 32,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cursos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: InkWell(
                        onTap: () {
                          _navigateWithParams(
                            context,
                            SelecionarFamiliaPage(),
                            'cursos',
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Adicionar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 150,
                ),
                child: objNavigation['cursos'].length > 0
                    ? Container()
                    : Container(
                        height: 128,
                        margin: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        child: Text(
                          'Nenhum curso selecionado',
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: RaisedButton(
          onPressed: () {},
          color: Theme.of(context).accentColor,
          child: Center(
            child: Text(
              'Criar usuário',
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
