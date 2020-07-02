import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(',', '.'));
    double precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(',', '.'));
    double resultado = 0;
    String mensagem = 'Melhor abastecer com gasolina';

    resultado = precoAlcool / precoGasolina;

    print("precoAlcool: " +
        precoAlcool.toString() +
        ' precoGasolina: ' +
        precoGasolina.toString() +
        " resultado: " +
        resultado.toString());

    if (resultado >= 0.7) {
      mensagem = "Melhor abastecer com alcool";
    }

    setState(() {
      _textoResultado = mensagem;
    });

    _limparCampos();
  }

  void _limparCampos() {
    _controllerAlcool.clear();
    _controllerGasolina.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasoza - Alcool ou Gasolina"),
      ),
      body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset("assets/imagens/logo.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text(
                        "Saiba qual a melhor opção para abastecimento do seu carro!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: "Preço Alcool, ex: 1.59"),
                    style: TextStyle(fontSize: 22),
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Preço da Gasolina, ex: 3.15"),
                    style: TextStyle(fontSize: 22),
                    controller: _controllerGasolina,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: RaisedButton(
                        child: Text("Calcular", style: TextStyle(fontSize: 20)),
                        color: Colors.lightBlue,
                        onPressed: _calcular,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _textoResultado,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))),
    );
  }
}
