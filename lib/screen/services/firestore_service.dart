import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> productos() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance.collection('productos').snapshots();
  }
  
  Stream<QuerySnapshot> pedidos() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance.collection('pedidos').snapshots();
  }

  Stream<QuerySnapshot> producto(String nombre) {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance.collection('productos').where('name', isEqualTo: nombre).snapshots();
  }

  //agregar
  Future agregar(String nombre, int stock, int precio) {
    return FirebaseFirestore.instance.collection('productos').doc().set({
      'name': nombre,
      'stock': stock,
      'price': precio,
    });
  }

  //borrar
  Future borrar(String productoId) {
    return FirebaseFirestore.instance.collection('productos').doc(productoId).delete();
  }
  Future editar(String id,String nombre, int stock, int precio) {
    
    return FirebaseFirestore.instance.collection('productos').doc(id).update({
      'name':nombre,
      'stock':stock,
      'price':precio,
    });
  }
}
