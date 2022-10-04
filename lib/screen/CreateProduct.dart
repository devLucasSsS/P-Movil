import 'package:flutter/material.dart';
class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear un producto'),
        leading: Icon(Icons.construction),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text('Ingresa el nombre del producto:',style: TextStyle(fontSize: 20),),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el nombre',
              ),
            ),
            Text('Ingresa el stock del producto:',style: TextStyle(fontSize: 20),),
            TextFormField(
                keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el stock',
              ),
            ),
            Text('Ingresa el precio del producto:',style: TextStyle(fontSize: 20),),
            TextFormField(
                keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el precio',
              ),
            ),
            Text('Ingresa el estado del producto:',style: TextStyle(fontSize: 20),),
            TextFormField(
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
              backgroundColor: Colors.deepPurpleAccent
            ),
            onPressed: (){
            },
          )
          ],
        ),
      ),

    );
  }
}