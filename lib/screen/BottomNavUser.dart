import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';
import 'package:flutter_application_1/screen/OrderPage.dart';


class BottomNavUser extends StatefulWidget {
  const BottomNavUser({super.key});

  @override
  State<BottomNavUser> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavUser> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    ListProducts(),
    OrderPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2,),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Orden',
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
      ),
    );
  }
}
