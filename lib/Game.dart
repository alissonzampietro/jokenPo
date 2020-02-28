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
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30),
            child: customTitle('App choice: '),
          ),
          Image.asset(
              'assets/images/padrao.png',
              cacheWidth: this.size,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30),
            child: customTitle('You lose: ')
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