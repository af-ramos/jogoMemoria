//import 'dart:async';

import 'package:flutter/material.dart';
import 'nivel1_tabuleiro.dart';

class Nivel1 extends StatefulWidget {
  Nivel1State createState() => new Nivel1State();
}

class Nivel1State extends State<Nivel1> {
  int score = 0;
  int time = 0;

  @override
  void initState() {
    super.initState();
    //Timer(Duration(seconds: 2), runTimer);
  }

  /*void runTimer() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        this.time += 1;
        runTimer();
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black87,
        body: Stack(
          children: <Widget>[
            Center(
              child: new Image.asset(
                'asset/fundos/fundo_jogo1.jpg',
                width: (MediaQuery.of(context).size).width,
                height: (MediaQuery.of(context).size).height,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 0.0),
                  //buildScore(),
                  buildBoard()
              ],
            ), 
          ),
        ],
      ),
    );
  }

  /*Widget buildScore() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(time.toString() + "s",
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.yellowAccent,)),
          Text(score.toString(),
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.yellowAccent,))
        ],
      ),
    );
  }*/

  Widget buildBoard() {
    return Flexible(
        child: Stack(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0), child: CardBoard(onWin: onWin)),
        //buildGradientView()
      ],
    ));
  }

  /*Widget buildGradientView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 32.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black, Colors.transparent])),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 32.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black, Colors.black])),
        )
      ],
    );
  }*/

  void onWin() {
    setState(() => this.score += 200);
  }
}
