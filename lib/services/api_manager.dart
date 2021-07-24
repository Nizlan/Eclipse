import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiManager {
  Future fetch() async {
    try {
      var response = await http.get(
          Uri.https("my-json-server.typicode.com", "/znol1/Eclipse/users"));
      var jsonString = response.body;
      // var jsonMap = json.decode(jsonString);
      return jsonString;
    } catch (error) {
      print(error);
    }
  }

  Future addComent(jsonData) async {
    try {
      await http.post(
          Uri.https("my-json-server.typicode.com", "/znol1/Eclipse/users"),
          body: jsonData);
    } catch (error) {
      print(error);
    }
  }
}
