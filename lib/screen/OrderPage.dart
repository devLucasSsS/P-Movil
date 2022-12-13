import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            'Orden',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                _crearInput1(),
                SizedBox(
                  height: 30,
                ),
                _crearInput2(),
                SizedBox(
                  height: 30,
                ),
                _crearInput3(),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _crearInput1() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Nombre del cliente',
            hintText: 'Nombre'),
      ),
    );
  }

  Widget _crearInput2() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.sell),
            labelText: 'Nombre del producto',
            hintText: 'Producto'),
      ),
    );
  }

  Widget _crearInput3() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.add_shopping_cart),
            labelText: 'Cantidad del producto',
            hintText: 'Cantidad'),
      ),
    );
  }
}
