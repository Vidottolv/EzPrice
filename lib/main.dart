// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzPrice',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(51, 24, 117, 1),
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/gradMorpheu.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/ezprice-removebg-preview.png',
                      height: 120)),
            ),
          ),
        ]),
      ),
    );
  }
}
