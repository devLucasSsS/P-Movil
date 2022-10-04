import 'package:flutter/material.dart';

class servicios extends StatefulWidget {
  servicios({Key? key}) : super(key: key);

  @override
  State<servicios> createState() => _serviciosState();
}

class _serviciosState extends State<servicios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C1 DAM020-2022-2'),
        centerTitle: true,
        bottom: PreferredSize(
            child: Text("David Vásquez"), preferredSize: Size.zero),
        leading: Icon(Icons.person),
        backgroundColor: Color(0xff591607),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.hotel,
              color: Colors.brown,
            ),
            title: Text('Viaje Antofagasta'),
            subtitle: Text(''),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.business, color: Colors.brown),
            title: Text('Viaje Atacama'),
            subtitle: Text(''),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.train, color: Colors.brown),
            title: Text('Viaje desierto florido'),
            subtitle: Text(''),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.beach_access, color: Colors.brown),
            title: Text('Viaje la serena'),
            subtitle: Text(''),
          ),
          Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
          Container(
            child: Image.asset("assets/desierto.jpg"),
          )
        ],
      ),
    );
  }
}
