import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/ProductosProvider.dart';
import 'package:flutter_application_1/screen/CreateProductCertamen.dart';
import 'package:flutter_application_1/screen/ListProductDetail.dart';
import 'package:flutter_application_1/screen/RemoveProductCertamen.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

var _scaffoldState = GlobalKey<ScaffoldState>();

class ListProducts extends StatefulWidget {
  // const ListProducts({super.key});
  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: 0);
  ProductosProvider productos = ProductosProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Productos'),
        backgroundColor: Colors.deepPurpleAccent,
        
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CreateProduct(
                  codigo: "",
                  nombre: "",
                  precio: 0,
                  stock: 0,
                  estado: "",
                );
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.add),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RemoveProduct(
                  codigo: "",
                );
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.remove),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListProductDetail(
                  codigo: "",
                  nombre: "",
                  precio: 0,
                  stock: 0,
                  estado: "",
                );
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.search),
            ),
          ),
        ],
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<dynamic>(
                future: productos.getProductos(),
                builder: (context, snapshot) {
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
                          title: Text(snapshot.data[index]['nombre'],),
                          trailing: 
                                Text(currencyFormatter.format(int.parse(precio))+' CLP'),
                          subtitle: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Codigo: ' +snapshot.data[index]['id']),
                                Text('Stock: ${snapshot.data[index]['stock']}'),
                                Text('Estado: ' +snapshot.data[index]['estado']),
                                Divider(
                                  thickness: 1.5,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                              
                        );
                      },                      
                    );
                  }
                },
              ),
              
            ),
                          
          ],
        ),
      ),
    );
  }
}
