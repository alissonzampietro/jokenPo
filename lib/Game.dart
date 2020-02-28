import 'dart:math' show Random;

import 'package:flutter/material.dart';


class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  final double size = 80.0;

  MaterialAccentColor actualColor;

  Text customTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
    );
  }

  /*
  * Generating random colors
  * */
  void changeThemeColors() {
      setState(() {
        this.actualColor = Colors.accents[Random().nextInt(16)];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Joken Po'),
        backgroundColor: this.actualColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 10),
            child: customTitle('App choice: '),
          ),
          GestureDetector(
            onDoubleTap: changeThemeColors,
            child: Image.asset(
              'assets/images/padrao.png',
              height: this.size,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 10),
            child: customTitle('Choose your option: ')
          ),
          Row(
            /*
            * Below you can see how to organize
            * item inside a row using mainAxisAlignment
            * */
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                  'assets/images/pedra.png',
                  height: this.size,

              ),
              Image.asset(
                  'assets/images/papel.png',
                  height: this.size,
              ),
              Image.asset(
                  'assets/images/tesoura.png',
                  height: this.size,
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 100),
              child: RaisedButton(
                onPressed: this.changeThemeColors,
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.all(30),
                child: Text('Change color'),
              ),
          )
        ],
      ),
    );
  }
}