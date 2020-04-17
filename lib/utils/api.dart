import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  var url = "https://api.hgbrasil.com/finance?format=json&key=bb98e58d";

  Future<Map> getData() async {
    var response = await http.get(url);
    return json.decode(response.body);
  }
}
