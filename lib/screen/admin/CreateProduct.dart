import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/services/firestore_service.dart';
class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController stockCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
        backgroundColor: Color.fromARGB(255, 86, 233, 172),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text('Agregar Producto'),
                  onPressed: () => create(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    void create(context) async{

      int stock = int.tryParse(stockCtrl.text.trim()) ?? 0;
      int price= int.tryParse(priceCtrl.text.trim()) ?? 0;
      var nombre = nameCtrl.text.trim();
      if(nombre == ''){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error, el nombre no puede estar vacio'))
        );
      }else if(stock < 1){
                ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error, el stock no puede ser 0'))
        );
      }else if(price < 1){
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error, el precio no puede ser 0'))
        );
      }else{
        FirestoreService().agregar(
          nombre,
          stock,
          price,
        );
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto Agregado'))
        );
      }
    }
  }