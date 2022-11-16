import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../domain/post.dart';
import '../providers/ProductosProvider.dart';
class ListProductDetail extends StatefulWidget {
  // const ListProductDetail({super.key});
  String codigo;
  String nombre;
  int precio;
  int stock;
  String estado;
  bool _isApiProcess = true;

ListProductDetail({
  required this.codigo,
  required this.nombre,
  required this.precio,
  required this.stock,
  required this.estado,
  });

  @override
  State<ListProductDetail> createState() => _ListProductDetailState();
}

class _ListProductDetailState extends State<ListProductDetail> {
  final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: 0);
  ProductosProvider productos = ProductosProvider();
  TextEditingController _controllerCodigo = TextEditingController();
  @override
  void initState() {
    _controllerCodigo.text = widget.codigo;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          
          ),
        
        title: Text('Consultar un producto'),
        backgroundColor: Colors.deepPurpleAccent,
        
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Ingresa el codigo del producto para consultar',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _controllerCodigo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el codigo',
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

                if (codigo.isEmpty) {
                  showSnackbarMessage("codigo es requerido");
                } else {
                  setState(() {
                    widget._isApiProcess = true;                    // Post1 post1 = Post1(
                    //     codigo: codigo,);
                  });
                }
              },
            ),
            Expanded(
              child: FutureBuilder<dynamic>(
                future: productos.getDetalle(_controllerCodigo.text),
                builder: ((context, snapshot) {
                                    if (!snapshot.hasData) {
                    return Center(
                        child: Container(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Cargando datos....'),
                                CircularProgressIndicator(),
                              ],
                            )));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        String precio = '${snapshot.data[index]['precio']}';
                        return ListTile(
                          leading: Icon(MdiIcons.chemicalWeapon),
                          title: Text(snapshot.data[index]['nombre']),
                          subtitle: Container(
                            child: Column(
                              children: [
                                Text('Codigo: ' +snapshot.data[index]['id'],),
                                Text('Stock: ${snapshot.data[index]['stock']}'),
                                Text('Estado: ' +snapshot.data[index]['estado']),
                              ],
                            ),
                          ),
                          trailing:
                              Text(currencyFormatter.format(int.parse(precio))+' CLP'),
                          
                        );
                      },
                      
                      
                    );
                  }
                }),
              ),
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