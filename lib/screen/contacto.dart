import 'package:flutter/material.dart';

class contacto extends StatefulWidget {
  contacto({Key? key}) : super(key: key);

  @override
  State<contacto> createState() => _contactoState();
}

DateTime date = DateTime(2022, 10, 04);

class _contactoState extends State<contacto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C1 DAM020-2022-2'),
        leading: Icon(Icons.construction),
        backgroundColor: Color(0xff591607),
        bottom: PreferredSize(
          child: Text("David Vásquez"),
          preferredSize: Size.zero,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Email',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese su email',
              ),
            ),
            Text(
              'Edad',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese su edad',
              ),
            ),
            Text(
              'Fecha de viaje',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${date.day}/${date.month}/${date.year}',
              style: TextStyle(fontSize: 18, color: Colors.blue.shade700),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text('Seleccionar fecha'),
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2022, 10, 04),
                  lastDate: DateTime(2100),
                );
                if (newDate == null) return;

                setState(() => date = newDate);
              },
            ),
            OutlinedButton(
              child: Text('Enviar'),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(800, 30),
                primary: Colors.white,
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
