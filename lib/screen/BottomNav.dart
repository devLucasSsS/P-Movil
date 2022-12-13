import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/admin/CreateProduct.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';
import 'ListProducts.dart';
import 'admin/CreateProduct.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    CreateProduct(),
    ListProducts(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurpleAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.construction,
                color: Colors.white,
              ),
              label: 'Crear',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_outlined,
                color: Colors.white,
              ),
              label: 'Listar',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
