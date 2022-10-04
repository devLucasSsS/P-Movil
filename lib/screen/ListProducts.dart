import 'package:flutter/material.dart';
class ListProducts extends StatefulWidget {
  const ListProducts({super.key});

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de productos'),
        leading: Icon(Icons.list),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.icecream,
              color: Colors.brown,
            ),
            title: Text('Helado'),
            subtitle: Text('20 unidades                                              \$1000'),
            
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.local_cafe,
            color: Colors.brown),
            title: Text('Café'),
            subtitle:Text('50 unidades                                              \$1000'),

          ),
           Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.cake,
            color: Colors.brown),
            title:Text('Torta') ,
            subtitle: Text('13 unidades                                              \$1000'),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.local_pizza,
            color: Colors.brown),
            title:Text('Pizza') ,
            subtitle: Text('15 unidades                                              \$1000'),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}