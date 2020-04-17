import 'package:http/http.dart' as http;

class Api {
  var url = "https://api.hgbrasil.com/finance?format=json&key=bb98e58d";

  void dados() async {
    var response = await http.get(url);
    print(response.body);
  }
}
