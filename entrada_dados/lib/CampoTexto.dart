import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";
  bool _selecionado = true;

  void _calcular(){

    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    }else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com álcool";
        });
      }
      if (_selecionado){
        _limpar();
      }

    }
  }

  void _limpar(){
    _controllerGasolina.text  = "";
    _controllerAlcool.text    = "";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32,),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Álcool, ex: 1.50",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.59",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),
              CheckboxListTile(
                  title: Text("Limpar campos após calcular"),
                  value: _selecionado,
                  onChanged: (bool e){
                    setState(() {
                      _selecionado = e;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: _calcular
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
