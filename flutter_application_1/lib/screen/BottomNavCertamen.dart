import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/CreateProductCertamen.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';

import 'package:flutter_application_1/screen/Login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    Login(),
    ListProducts(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: (Colors.blue.shade300),
          title: Text(
            'C2 DAM020-CLIENTE',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            child: Text(
              'Lucas Ossandón',
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            preferredSize: Size.zero,
          ),
          leading: Icon(MdiIcons.calendarAlert)),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurpleAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.account,
                color: Colors.white,
              ),
              label: 'Login',
              
              
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
