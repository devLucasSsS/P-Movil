import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/post.dart';
import 'package:flutter_application_1/providers/ProductosProvider.dart';
import 'dart:convert';
var _scaffoldState = GlobalKey<ScaffoldState>();

class CreateProduct extends StatefulWidget {
  // CreateProduct({Key? key}) : super(key: key);

  String codigo;
  String nombre;
  int precio;
  int stock;
  String estado;
  bool _isApiProcess = true;

  CreateProduct(
      {required this.codigo,
      required this.nombre,
      required this.precio,
      required this.stock,
      required this.estado});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  ProductosProvider productos = ProductosProvider();
  TextEditingController _controllerCodigo = TextEditingController();
  TextEditingController _controllerNombre = TextEditingController();
  TextEditingController _controllerPrecio = TextEditingController();
  TextEditingController _controllerStock = TextEditingController();
  TextEditingController _controllerEstado = TextEditingController();
  @override
  void initState() {
    _controllerCodigo.text = widget.codigo;
    _controllerNombre.text = widget.nombre;
    _controllerPrecio.text = widget.precio.toString();
    _controllerStock.text = widget.stock.toString();
    _controllerEstado.text = widget.estado;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          
          ),
        
        title: Text('Crear un producto'),
        backgroundColor: Colors.deepPurpleAccent,
        
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Ingresa el codigo del producto:',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _controllerCodigo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el codigo',
              ),
            ),
            Text(
              'Ingresa el nombre del producto:',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _controllerNombre,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el nombre',
              ),
            ),
            Text(
              'Ingresa el stock del producto:',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _controllerStock,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el stock',
              ),
            ),
            Text(
              'Ingresa el precio del producto:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
            TextFormField(
              controller: _controllerPrecio,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el precio',
              ),
            ),
            Text(
              'Ingresa el estado del producto:',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _controllerEstado,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el estado',
              ),
            ),
            OutlinedButton(
              child: Text('Enviar'),
              style: OutlinedButton.styleFrom(
                  fixedSize: const Size(800, 30),
                  primary: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent),
              onPressed: () {
                String codigo = _controllerCodigo.text.toString().trim();
                String nombre = _controllerNombre.text.toString().trim();
                int precio = _controllerPrecio.text.toString().isEmpty
                    ? 0
                    : int.parse(_controllerPrecio.text.toString());
                int stock = _controllerStock.text.toString().isEmpty
                    ? 0
                    : int.parse(_controllerStock.text.toString());
                String estado = _controllerEstado.text.toString().trim();

                if (codigo.isEmpty) {
                  showSnackbarMessage("codigo es requerido");
                } else if (nombre.isEmpty) {
                  showSnackbarMessage("nombre es requerido");
                } else if (precio == 0) {
                  showSnackbarMessage("precio es requerido");
                } else if (stock == 0) {
                  showSnackbarMessage("stock es requerido");
                } else if (estado.isEmpty) {
                  showSnackbarMessage("estado es requerido");
                } else {
                  setState(() {
                    widget._isApiProcess = true;
                    Post post = Post(
                        codigo: codigo,
                        nombre: nombre,
                        precio: precio,
                        stock: stock,
                        estado: estado);
                    print('post al json:' + postToJson(post));
                    productos.CreatePost(post).then((response) {
                      var respuesta = response;
                      widget._isApiProcess = false;
                      print('asd '+respuesta.body);
                      // if(response == 0){
                      //   showSnackbarMessage("Error, ya existe ese producto en la base de datos...");
                      // }
                      if (response.statusCode == 200) {
                        Navigator.pop(context);
                        showSnackbarMessage("Validacion Aceptada");
                      } else {
                        showSnackbarMessage("Falló");
                      }
                    });
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void showSnackbarMessage(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }
}
