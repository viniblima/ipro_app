import 'package:flutter/material.dart';
import 'package:ipro_app/pages/cadastro.page.dart';
import 'package:ipro_app/pages/login-email.page.dart';
import 'package:ipro_app/util/slide-route.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: Container(
            // color: Colors.blue,
            height: 250,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/images/ipro_icon.jpeg'),
                  height: 200,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Seja bem-vindo à sua igreja online!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 120,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      offset: Offset(1, 0),
                      page: LoginEmailPage(),
                    ),
                  );
                },
                color: Theme.of(context).accentColor,
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      offset: Offset(0, 1),
                      page: CadastroPage(),
                    ),
                  );
                },
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
