import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/admin/CreateProduct.dart';
import 'package:flutter_application_1/screen/admin/EditProduct.dart';
import 'package:flutter_application_1/screen/services/firestore_service.dart';

class ListProductsAdmin extends StatelessWidget {
  const ListProductsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRODUCTOS'),

      ),
      body: StreamBuilder(
        stream: FirestoreService().productos(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){
              var product = snapshot.data!.docs[index];
              return ListTile(
                title: Text(product['name']),
                subtitle: Text('Stock:${product['stock'].toString()}'),
                trailing: Text('Precio:${product['price'].toString()}'),
                onLongPress: () {
                  FirestoreService().borrar(product.id);
                },
                onTap: () {
                  var nombre = product['name'];
                  MaterialPageRoute route = MaterialPageRoute(builder: ((context) => new EditProduct(nombre)));
                  Navigator.push(context, route);
                },
                
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(builder: ((context) => CreateProduct()));
          Navigator.push(context, route);
        },
      ),
    );
  }

  
}