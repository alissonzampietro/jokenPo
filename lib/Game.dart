import 'dart:math' show Random;

import 'package:flutter/material.dart';


class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  final double size = 80.0;

  List options = [
      'pedra',
      'papel',
      'tesoura'
  ];

  var relationWinner = {
    'pedra': {
      "win": "tesoura",
      "lose": "papel"
    },
    'papel': {
      "win": "pedra",
      "lose": "tesoura"
    },
    'tesoura': {
      "win": "papel",
      "lose": "pedra"
    }
  };

  String actualImage = "padrao";
  String message = "";
  var textColor;
  int scoreApp = 0;
  int scorePlayer = 0;

  MaterialAccentColor actualColor;

  void setAutoImage(String image) {
    this.setState(() {
      this.actualImage = image;
    });
  }

  void selectOption(String player) {
    String computer = this.options[Random().nextInt(3)];
    String message = isWinner(computer, player);
    this.setState((){
      this.actualImage = computer;
      this.message = message;
    });
  }

  String isWinner(String computer, String player) {
    var playerProperties;
    this.relationWinner.forEach((key, item) {
      if(key == player) {
        playerProperties = item;
      }
    });

    if(playerProperties["win"] == computer) {
      this.textColor = Colors.green;
      this.scorePlayer++;
      return "You win";
    }else if(playerProperties["lose"] == computer) {
      this.textColor = Colors.deepOrange;
      this.scoreApp++;
      return "You lose";
    }else {
      this.textColor = Colors.black;
      return "Draw";
    }
  }

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
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: customTitle('App choice: '),
          ),
          Image.asset("assets/images/"+this.actualImage+".png"),
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                this.message,
                style: TextStyle(
                    color: this.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
          )),
          Column(
            children: <Widget>[
              Text("APP Score: ${this.scoreApp}"),
              Text("Your Score: ${this.scorePlayer}"),
            ],
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
              GestureDetector(
                onTap: () => this.selectOption("pedra"),
                child: Image.asset(
                  'assets/images/pedra.png',
                  height: this.size,
                ),
              ),
              GestureDetector(
                onTap: () => this.selectOption("papel"),
                child: Image.asset(
                  'assets/images/papel.png',
                  height: this.size,
                ),
              ),
              GestureDetector(
                onTap: () => this.selectOption("tesoura"),
                child: Image.asset(
                  'assets/images/tesoura.png',
                  height: this.size,
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 50),
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