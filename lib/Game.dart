import 'package:flutter/material.dart';


class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  final size = 80;

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Joken Po'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 10),
            child: customTitle('App choice: '),
          ),
          Image.asset(
              'assets/images/padrao.png',
              cacheWidth: this.size,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 10),
            child: customTitle('Choose your option: ')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                  'assets/images/pedra.png',
                  cacheWidth: this.size,

              ),
              Image.asset(
                  'assets/images/papel.png',
                  cacheWidth: this.size,
              ),
              Image.asset(
                  'assets/images/tesoura.png',
                  cacheWidth: this.size,
              ),
            ],
          )
        ],
      ),
    );
  }
}