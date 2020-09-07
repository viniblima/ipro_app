import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class NewSplashScreen extends StatefulWidget {
  final int seconds;
  final dynamic navigateAfterSeconds;
  final bool isLogged;

  NewSplashScreen({
    @required this.seconds,
    this.navigateAfterSeconds,
    @required this.isLogged,
  });

  @override
  _NewSplashScreenState createState() => _NewSplashScreenState();
}

class _NewSplashScreenState extends State<NewSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: widget.seconds), () {
      if (widget.navigateAfterSeconds is String) {
        // It's fairly safe to assume this is using the in-built material
        // named route component
        Navigator.of(context).pushReplacementNamed(widget.navigateAfterSeconds);
      } else if (widget.navigateAfterSeconds is Widget) {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (BuildContext context) => widget.navigateAfterSeconds,
          ),
        );
      } else {
        throw new ArgumentError(
            'widget.navigateAfterSeconds must either be a String or Widget');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.yellow,
        child: Center(
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  // color: Colors.green,
                  alignment: Alignment.centerRight,
                  height: 100,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: FlutterLogo(),
                  ),
                ),
                Container(
                  height: 100,
                  alignment: Alignment.centerLeft,
                  child: Animator<double>(
                    tween: Tween<double>(
                        begin: 0, end: MediaQuery.of(context).size.width / 2),
                    repeats: 1,
                    cycles: 0,
                    duration: Duration(seconds: 3),
                    builder: (context, animatorState, child) => Center(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 100,
                        width: animatorState.value,
                        child: RichText(
                          softWrap: false,
                          text: TextSpan(
                            text: 'Seja bem-vindo',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
