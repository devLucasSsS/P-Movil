import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/services/firestore_service.dart';

class EditProduct extends StatefulWidget {
  String nombre;
  EditProduct(this.nombre);
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController stockCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
        backgroundColor: Color.fromARGB(255, 86, 233, 172),
      ),
      body: StreamBuilder(
        stream: FirestoreService().producto(widget.nombre),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var product = snapshot.data!.docs[0];
          var id = product.id;
          nameCtrl.text = product['name'];
          stockCtrl.text = product['stock'].toString();
          priceCtrl.text = product['price'].toString();
          return Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                enabled: false,
                decoration: InputDecoration(
                  label: Text('Nombre'),
                ),
              ),
              TextFormField(
                controller: stockCtrl,
                decoration: InputDecoration(
                  label: Text('Stock'),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: priceCtrl,
                decoration: InputDecoration(
                  label: Text('Precio'),
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 48, 46, 46)),
                  child: Text('Editar Producto'),
                  onPressed: () {
                    int stock = int.tryParse(stockCtrl.text.trim()) ?? 0;
                    int price= int.tryParse(priceCtrl.text.trim()) ?? 0;
                    FirestoreService().editar(
                      id,
                      nameCtrl.text.trim(),
                      stock,
                      price,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Producto Editado'))
                    );
                  },
                ),
              ),
            ],
          ),
        );
        }
      ) 
      );
  }
}