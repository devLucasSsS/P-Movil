import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/domain/post.dart';

class ProductosProvider {
  final apiURL = 'http://10.0.2.2/api_flutter/';
  Future<List<dynamic>> getProductos() async {
    var url = Uri.parse('$apiURL?listar');
    var respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
  Future<List<dynamic>> getDetalle(String codigo) async {
    var url = Uri.parse('$apiURL?consultar='+codigo);
    var respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<http.Response> CreatePost(Post post) async {
    var url = Uri.parse('$apiURL?agregar');
    var respuesta = await http.post(url, body: postToJson(post));
    return respuesta;
  }
  Future<http.Response> DeleteItem(Post1 post) async {
    var url = Uri.parse('$apiURL?eliminar');
    var respuesta = await http.post(url, body: postToJson1(post));
    return respuesta;
  }
}
