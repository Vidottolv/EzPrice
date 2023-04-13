// ignore_for_file: prefer_const_constructors

import 'package:ezprice/view/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'tela principal',
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final containerHeight =
        screenHeight * 0.7 - 120; // subtrai a altura da imagem do EzPrice

    return Scaffold(
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
            top: screenHeight * 0.1,
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
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 50),
              child: Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.4), width: 1.5)),
                  height: containerHeight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Widgets().widgetEmail(),
                        SizedBox(height: 10),
                        Widgets().widgetSenha(),
                        SizedBox(height: 10),
                        Widgets().widgetEntrar(context),
                        SizedBox(height: 10),
                        Widgets().widgetEsqueceSenha(context),
                        SizedBox(height: 10),
                        Widgets().widgetNovoAqui(context),
                        SizedBox(height: 30),
                        Widgets().widgetSobreNos(context)
                      ])),
            )
          ])
        ],
      ),
    );
  }
}
