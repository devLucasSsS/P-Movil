import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screen/admin/CreateProduct.dart';
import 'package:flutter_application_1/screen/admin/EditProduct.dart';
import 'package:flutter_application_1/screen/services/firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ListOrders extends StatelessWidget {
  const ListOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PEDIDOS'),
        backgroundColor: Color.fromARGB(255, 48, 46, 46),
      ),
      body: StreamBuilder(
        stream: FirestoreService().pedidos(),
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
              var Order = snapshot.data!.docs[index];
              return ListTile(
                title: Text('Nombre cliente: '+Order['nombre']),
                subtitle: 
                      Text('Producto: '+Order['producto'] + '\n'
                      'Cantidad: ${Order['cantidad'].toString()}'),
                // trailing: Text('Total:${Order['total'].toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}