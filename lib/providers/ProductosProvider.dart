// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductosProvider {
  final apiURL = 'http://10.0.2.2/api_flutter/?listar';
  Future<List<dynamic>> getProductos() async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.get(url);
    if(respuesta.statusCode == 200){
      return json.decode(respuesta.body);
    }else{
      return [];
    }
  }
}