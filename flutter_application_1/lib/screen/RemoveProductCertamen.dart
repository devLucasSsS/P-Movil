import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/ProductosProvider.dart';
import 'package:flutter_application_1/domain/post.dart';
class RemoveProduct extends StatefulWidget {
  // const RemoveProduct({super.key});
  String codigo;
  bool _isApiProcess = true;
  RemoveProduct({required this.codigo});
  @override
  State<RemoveProduct> createState() => _RemoveProductState();
}

class _RemoveProductState extends State<RemoveProduct> {
  ProductosProvider productos = ProductosProvider();
  TextEditingController _controllerCodigo = TextEditingController();

  
  @override
  void initState() {
    // TODO: implement initState
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
        
        title: Text('Eliminar un producto'),
        backgroundColor: Colors.deepPurpleAccent,
        
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Ingresa el codigo del producto para eliminar',
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
                    widget._isApiProcess = true;
                    Post1 post1 = Post1(
                        codigo: codigo,);
                    print('post al json:' + postToJson1(post1));
                    productos.DeleteItem(post1).then((response) {
                      widget._isApiProcess = false;
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