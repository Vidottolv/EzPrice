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
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: 'EzPrice',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(51, 24, 117, 1),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/gradMorpheu.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(),
            ),
            Positioned(
              top: screenHeight * 0.75,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/ezprice-removebg-preview.png',
                  height: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
