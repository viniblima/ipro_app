import 'package:flutter/material.dart';
import 'package:ipro_app/pages/initial-tabs.page.dart';
import 'package:ipro_app/pages/login.page.dart';
import 'package:ipro_app/pages/splash-screen.page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    logado: false,
  ));
}

class MyApp extends StatelessWidget {
  final bool logado;

  MyApp({
    @required this.logado,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPRO',
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        primaryColor: Color(0xFF263238),
        accentColor: Color(0xFFFCCD2F),
        primarySwatch: MaterialColor(
          0xFF65d3c3,
          {
            50: Color(0xFF65d3c3),
            100: Color(0xFF65d3c3),
            200: Color(0xFF65d3c3),
            300: Color(0xFF65d3c3),
            400: Color(0xFF65d3c3),
            500: Color(0xFF65d3c3),
            600: Color(0xFF65d3c3),
            700: Color(0xFF65d3c3),
            800: Color(0xFF65d3c3),
            900: Color(0xFF65d3c3),
          },
        ),
        backgroundColor: Color(0xFFFFFFF),
        fontFamily: 'Montserrat',
      ),
      home: NewSplashScreen(
        seconds: 5,
        navigateAfterSeconds: logado ? InitialTabs() : LoginPage(),
        isLogged: logado,
      ),
    );
  }
}
