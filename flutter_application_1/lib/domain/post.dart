// import 'dart:html';
import 'dart:convert';

class Post {
  String codigo;
  String nombre;
  int precio;
  int stock;
  String estado;
  Post(
      {required this.codigo,
      required this.nombre,
      required this.precio,
      required this.stock,
      required this.estado});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      codigo: json['codigo'],
      nombre: json['nombre'],
      precio: json['precio'],
      stock: json['stock'],
      estado: json['estado'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "codigo": codigo,
      "nombre": nombre,
      "precio": precio,
      "stock": stock,
      "estado": estado,
    };
  }

  @override
  String toString() {
    return 'Post{codigo: $codigo, nombre: $nombre, precio: $precio, stock: $stock, estado: $estado}';
  }
}

class Post1{
  String codigo;
  Post1(
      {required this.codigo,});

  factory Post1.fromJson(Map<String, dynamic> json) {
    return Post1(
      codigo: json['codigo'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "codigo": codigo,
    };
  }

  @override
  String toString() {
    return 'Post1{codigo: $codigo}';
  }
}


Post postFromJson(String strJson) {
  final str = json.decode(strJson);
  return Post.fromJson(str);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
Post1 postFromJson1(String strJson) {
  final str = json.decode(strJson);
  return Post1.fromJson(str);
}

String postToJson1(Post1 data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
