import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/ProductosProvider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListProducts extends StatefulWidget {
  // const ListProducts({super.key});
  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  ProductosProvider productos = ProductosProvider();
  @override
  Widget build(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Text(
              'Listado de productos',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            //FutureBuilder para esperar los datos que llegarán en un futuro
            //al enviar la solicitud al api, futurbuilder requiere una instancia para
            //ver si los datos han llegado o no, y mantener info al usuario, se crea una instancia
            //MonedaProvider monedas = MonedaProvider();
            child: FutureBuilder<dynamic>(
              future: productos.getProductos(),
              //el snapshot es una representación de la conexión que hay con el API
              //nos permite obt los datos y saber el estado de estos. sin han llegado o no
              builder: (context, snapshot) {
                //si no tiene datos !snapshot
                if (!snapshot.hasData) {
                  //no han llegado los datos
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
                  //llegó la respuesta
                  // return Text('Llegó respuesta');
                  //builder espera 2 parámetros: itemcount para indicar cuántos ítems vienen en la lista
                  //itembuilder la fc para construir los datos
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Icon(MdiIcons.chemicalWeapon),
                          title: Text(snapshot.data[index]['nombre']),
                          subtitle: Text(snapshot.data[index]['id']),
                          trailing: Text('${snapshot.data[index]['precio']} CLP'),
                          );
                      //para poner un separador se puede usar ListView.separated en vez ListView.builder
                      //ListView.separated(separtor.Builder: (_, __) => Divider(),
                      //...
                      //...
                      //)
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
}
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('as'),
  //     ),
  // );
  // }
  // }

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Listado de productos'),
    //     leading: Icon(Icons.list),
    //     backgroundColor: Colors.deepPurpleAccent,
    //   ),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(
      //         Icons.icecream,
      //         color: Colors.brown,
      //       ),
      //       title: Text('Helado'),
      //       subtitle: Text('20 unidades                                              \$1000'),
            
      //     ),
      //     Divider(
      //       thickness: 1.5,
      //       color: Colors.black,
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.local_cafe,
      //       color: Colors.brown),
      //       title: Text('Café'),
      //       subtitle:Text('50 unidades                                              \$1000'),

      //     ),
      //      Divider(
      //       thickness: 1.5,
      //       color: Colors.black,
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.cake,
      //       color: Colors.brown),
      //       title:Text('Torta') ,
      //       subtitle: Text('13 unidades                                              \$1000'),
      //     ),
      //     Divider(
      //       thickness: 1.5,
      //       color: Colors.black,
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.local_pizza,
      //       color: Colors.brown),
      //       title:Text('Pizza') ,
      //       subtitle: Text('7 unidades                                              \$1000'),
      //     ),
      //     Divider(
      //       thickness: 1.5,
      //       color: Colors.black,
      //     ),
      //   ],
      // ),
}