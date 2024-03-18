// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutflix/colors.dart';
import 'package:flutflix/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(const MyApp());
}

Future<void> setup() async {

  await Future.delayed(const Duration(seconds: 2));  // una espera para el splashscreen
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutflix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        useMaterial3: true,
      ),
      //home: const HomeScreen(),
      home: Login(),
    );
  }
}




class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomPadding:
    false;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // con width y height puedo encajar la imagen para centrarla
            width: 430,
            height: 900,
            decoration: BoxDecoration(
              // aqui pongo la imagen
              image: DecorationImage(
                image: AssetImage('assets/dunee.png'), // Ruta de tu imagen
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 14, 143, 175),
                  Color.fromARGB(255, 5, 78, 100),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 247, 247, 247),
                          fontSize: 40),
                    ),
                    Text(
                      "Bienvenido",
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 125, 231),
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                    /*decoration: BoxDecoration(
                      color: Color.fromARGB(255, 50, 168, 236),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),*/
                    child: SingleChildScrollView(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(69, 76, 85, 0.694),
                                  borderRadius: BorderRadius.circular(10),
                                  /*boxShadow: [ // sombra de fondo del login
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 2, 3, 0.993),
                                      blurRadius: 5,
                                      offset: Offset(6, 10),
                                    ),
                                  ], */// borde para los textfield del login
                                  border: Border.all(
                                    color:  Color.fromARGB(255, 201, 133, 44), // Puedes ajustar el color del borde según tus necesidades
                                    width: 2, // Puedes ajustar el ancho del borde según tus necesidades
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromARGB(255, 201, 133, 44)))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Introduce tu usuario",
                                            hintStyle: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 252, 252, 252)),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Introduce tu password",
                                            hintStyle: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 252, 252, 252)),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
