import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/services/firestore_service.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            'Productos',
            style: TextStyle(color: Colors.black),
          )),
      body: StreamBuilder(
        stream: FirestoreService().productos(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var product = snapshot.data!.docs[index];
              return ListTile(
                title: Text(product['name']),
                subtitle: Text('Stock:${product['stock'].toString()}'),
                trailing: Text('Precio:${product['price'].toString()}'),
                textColor: Colors.black,
              );
            },
          );
        },
      ),
    );
  }
}
