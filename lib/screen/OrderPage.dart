import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/BottomNavUser.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';
import 'package:flutter_application_1/screen/services/firestore_service.dart';
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCCtrl = TextEditingController();
  TextEditingController namePCtrl = TextEditingController();
  TextEditingController cantCtrl = TextEditingController();

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
            key: formKey,
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
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => create(context),
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
        controller: nameCCtrl,
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
        controller: namePCtrl,
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
        controller: cantCtrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            icon: Icon(Icons.add_shopping_cart),
            labelText: 'Cantidad del producto',
            hintText: 'Cantidad'),
      ),
    );
  }
    void create(context) async{

      int cant = int.tryParse(cantCtrl.text.trim()) ?? 0;
      var nombre = nameCCtrl.text.trim();
      var producto= namePCtrl.text.trim();
      if(nombre == ''){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error, el nombre no puede estar vacio'))
        );
      }else if(cant < 1){
                ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error, el stock no puede ser 0'))
        );
      }else{
        FirestoreService().agregarPedido(
          nombre,
          producto,
          cant
        );
        MaterialPageRoute route = MaterialPageRoute(builder: ((context) => BottomNavUser()));
        Navigator.pushReplacement(context, route);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto Agregado'))
        );
      }
    }
  }