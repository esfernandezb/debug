import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class entrada extends StatefulWidget {
  @override
  _entradaState createState() => _entradaState();
}

class _entradaState extends State<entrada> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => logininsta())));
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/img/insta.jpg',height: 750,),
            ],
          ),
        ),

      ),
    );
  }
}
