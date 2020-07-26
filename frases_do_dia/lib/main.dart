import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Frase 1",
    "Frase 2",
    "Frase 3",
    "Frase 4",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child:
          Container(
            padding: EdgeInsets.all(16),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/logo.png"),
                Text(_fraseGerada),
                RaisedButton(child:
                      Text(
                    "Nova Frase",
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                    color: Colors.green,
                    onPressed: _gerarFrase)
          ],
        ),
      )
      ),
    );
  }
}
