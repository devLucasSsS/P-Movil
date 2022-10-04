import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/servicios.dart';
import 'package:flutter_application_2/screen/contacto.dart';
import 'servicios.dart';
import 'contacto.dart';

class navegacion extends StatefulWidget {
  navegacion({Key? key}) : super(key: key);

  @override
  State<navegacion> createState() => _navegacionState();
}

class _navegacionState extends State<navegacion> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    servicios(),
    contacto(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff591607),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.directions_bus,
                color: Colors.white,
              ),
              label: 'Servicios',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: 'Contacto/Reserva',
                backgroundColor: Colors.white),
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
