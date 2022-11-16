import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesion'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
        Text('Ingresa tu email'),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ingresa tu email'
          ),
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Por favor ingresa un email';
            }else if(value.length < 1){
              return 'Por favor ingresa un email valido';
            }
            return null;
          },
        ),
        Text('Ingresa tu contraseña'),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ingresa tu Contraseña'
          ),
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Por favor ingresa una contraseña';
            }else if(value.length < 1 || value.length > 8){
              return 'Por favor ingresa una contraseña de maximo 8 de largo';
            }
            return null;
          },
        ),
        OutlinedButton(
          child: Text('Enviar'),
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(800, 30),
            primary: Colors.white,
            backgroundColor: Colors.deepPurpleAccent
          ),
          onPressed: () {
            if(_formKey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Procesando data'))
              );
            }
          },
        )
          ],
        )

      ),
    );
  }
}