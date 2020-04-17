import 'package:conversor_moedas/components/input_currency.dart';
import 'package:flutter/material.dart';
import '../utils/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  Future dataFuture;
  double dolar;
  double euro;

  @override
  void initState() {
    super.initState();
    dataFuture = _getDataFuture();
  }

  Future<Map<String, dynamic>> _getDataFuture() async {
    Api api;
    return await api.getData();
  }

  void _realChanged(String text) {}
  void _dolarChanged(String text) {}
  void _euroChanged(String text) {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<Map>(
        future: dataFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao carregar dados",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                );
              }
              dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
              euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
              return SingleChildScrollView(
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
                        function: _realChanged,
                      ),
                      InputCurrency(
                        currencyController: dolarController,
                        size: size,
                        labelText: "Dolar",
                        prefixText: "US\$",
                        function: _dolarChanged,
                      ),
                      InputCurrency(
                        currencyController: euroController,
                        size: size,
                        labelText: "Euro",
                        prefixText: "€",
                        function: _euroChanged,
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
