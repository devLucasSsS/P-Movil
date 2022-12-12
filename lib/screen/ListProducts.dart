import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/ProductosProvider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}





// class ListProducts extends StatefulWidget {
//   // const ListProducts({super.key});
//   @override
//   State<ListProducts> createState() => _ListProductsState();
// }

// class _ListProductsState extends State<ListProducts> {
//   ProductosProvider productos = ProductosProvider();
//   @override
//   Widget build(BuildContext context) {
//   return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Container(
//             child: Text(
//               'Listado de productos',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<dynamic>(
//               future: productos.getProductos(),
//               //el snapshot es una representación de la conexión que hay con el API
//               //nos permite obt los datos y saber el estado de estos. sin han llegado o no
//               builder: (context, snapshot) {
//                 //si no tiene datos !snapshot
//                 if (!snapshot.hasData) {
//                   //no han llegado los datos
//                   return Center(
//                       child: Container(
//                           width: 200,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Cargando datos....'),
//                               CircularProgressIndicator(),
//                             ],
//                           )));
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                           leading: Icon(MdiIcons.chemicalWeapon),
//                           title: Text(snapshot.data[index]['nombre']),
//                           subtitle: Text(snapshot.data[index]['id']),
//                           trailing: Text('${snapshot.data[index]['precio']} CLP'),
//                           );
//                     },
//                   );
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }