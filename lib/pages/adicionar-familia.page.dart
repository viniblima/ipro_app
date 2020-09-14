import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipro_app/models/familia.model.dart';
import 'package:ipro_app/store/usuario/usuario.store.dart';
import 'package:ipro_app/widgets/input-field-cadastro.widget.dart';

class AdicionarFamiliaPage extends StatefulWidget {
  @override
  _AdicionarFamiliaPageState createState() => _AdicionarFamiliaPageState();
}

class _AdicionarFamiliaPageState extends State<AdicionarFamiliaPage> {
  TextEditingController nomeController = TextEditingController();
  UsuarioStore _usuarioStore = UsuarioStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(
          'ADICIONAR FAMÍLIA',
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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Somente precisamos do da sua família para criarmos ela!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                top: 24,
              ),
              child: InputFieldCadastro(
                controller: nomeController,
                label: 'Nome',
                typeKeyboard: TextInputType.emailAddress,
                isPassword: false,
                validatorEmpty: true,
                enabled: true,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Observer(
          builder: (_) => _usuarioStore.isLoading
              ? Container(
                  color: Theme.of(context).accentColor,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                )
              : RaisedButton(
                  onPressed: () {
                    Map familia = {
                      "nome": nomeController.text,
                    };

                    _usuarioStore.criarFamiliaApi(familia).then(
                      (element) {
                        if (element.statusCode == 200) {
                          Familia fm = Familia.fromJson(
                            {
                              "id": element.data['id'],
                              "nome": element.data['nome'],
                              "integrantes": [],
                            },
                          );

                          Navigator.of(context).pop(fm);
                          Navigator.of(context).pop(fm);
                          
                        } else {
                          _usuarioStore.isLoading = false;
                        }
                      },
                    );
                  },
                  color: Theme.of(context).accentColor,
                  child: Center(
                    child: Text(
                      'Criar família',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
