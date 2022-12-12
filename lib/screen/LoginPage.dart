import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';
import 'package:flutter_application_1/screen/admin/BottomNavAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 151, 240, 203),
            Color.fromARGB(255, 86, 233, 172),
            Colors.black
          ]
        )
      ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          width: double.infinity,
          height: 235,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Colors.deepPurple,
                  // Color.fromARGB(255, 230, 50, 110),
                  // Color.fromARGB(255, 42, 153, 243),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 86, 233, 172),
                ]
              ),
              // color: Colors.pink.shade200,
              // border: Border.all(
              //   color: Colors.lightGreen,
              // ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Inicio de sesión',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                  ),
                  Spacer(),
                  TextFormField(
                    controller: emailCtrl,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      
                      
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      label: Text('Contraseña'),
                    ),
                    obscureText: true,
                  ),

                  //BOTON LOGIN
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 86, 233, 172),),
                      child: Text('INICIAR SESIÓN', style: TextStyle(fontWeight: FontWeight.bold,),),
                      onPressed: () => login(),
                    ),
                  ),

                  //MENSAJES ERROR
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    )
    );
  }

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userEmail', userCredential.user!.email.toString());
      
      var id = await FirebaseAuth.instance.currentUser!;
      if(id.uid == '7wHdVrUCs0aDMhRGq0VjKDgZ5js2'){
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => BottomNavAdmin(),
        );
      Navigator.pushReplacement(context, route);
      }else{
      MaterialPageRoute route = MaterialPageRoute(
        builder: (context) => ListProducts(),
      );
      Navigator.pushReplacement(context, route);
      }
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case 'user-not-found':
          error = 'Usuario no existe';
          break;
        case 'wrong-password':
          error = 'Contraseña incorrecta';
          break;
        case 'user-disabled':
          error = 'Cuenta desactivada';
          break;
        default:
          error = 'Campos vacios';
          break;
      }
      setState(() {});
    }
  }
}
