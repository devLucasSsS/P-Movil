import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/LoginPage.dart';
import 'package:flutter_application_1/screen/admin/CreateProduct.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';
import 'package:flutter_application_1/screen/admin/ListOrders.dart';
import 'package:flutter_application_1/screen/admin/ListProductsAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BottomNavAdmin extends StatefulWidget {
  const BottomNavAdmin({super.key});

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    ListProductsAdmin(),
    ListOrders(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 233, 172),
        title: Text('ADMINISTRADOR'),
          actions: [PopupMenuButton(
          itemBuilder: (context)=>[
            PopupMenuItem(
              value: 'logout',
              child: Text('Cerrar Sesion'),
            )
          ],
          onSelected: (opcion){
            if(opcion == 'logout'){
              logout(context);
            }
          },
        )],
        
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 86, 233, 172),
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.construction,),
            label: 'Productos',
            
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Pedidos',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          print(index);
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }
  void logout(BuildContext context) async {
    //cerrar sesion en firebase
      await FirebaseAuth.instance.signOut();

      //borrar user email de shared preferences
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.remove('userEmail');

      //redirigir al login
      MaterialPageRoute route = MaterialPageRoute(builder: ((context) => LoginPage()));
      Navigator.pushReplacement(context, route);
  }
}