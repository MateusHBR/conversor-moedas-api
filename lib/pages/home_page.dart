import 'package:conversor_moedas/components/input_currency.dart';
import 'package:flutter/material.dart';
import '../utils/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var realController = TextEditingController();
  var dolarController = TextEditingController();
  var euroController = TextEditingController();
  Api api = Api();

  _loadData() {
    api.dados();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                color: Colors.purple,
                size: size.height * 0.30,
              ),
              InputCurrency(
                currencyController: realController,
                size: size,
                labelText: "Real",
                prefixText: "R\$",
              ),
              InputCurrency(
                currencyController: dolarController,
                size: size,
                labelText: "Dolar",
                prefixText: "US\$",
              ),
              InputCurrency(
                currencyController: euroController,
                size: size,
                labelText: "Euro",
                prefixText: "€",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
