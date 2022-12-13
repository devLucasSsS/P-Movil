import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';
import 'package:flutter_application_1/screen/OrderPage.dart';

void main() => runApp(const BottomNavUser());

class BottomNavUser extends StatefulWidget {
  const BottomNavUser({super.key});

  @override
  State<BottomNavUser> createState() => _MyAppState();
}

class _MyAppState extends State<BottomNavUser> {
  int _paginaActual = 0;

  List<Widget> _paginas = [
    ListProducts(),
    OrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2), label: "Productos"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Orden"),
          ],
        ),
      ),
    );
  }
}
