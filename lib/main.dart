import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:portuguese_job/selecaoJogos/telaJogos.dart';
import 'package:portuguese_job/nivel1/nivel1.dart';
import 'package:portuguese_job/nivel2/nivel2.dart';
import 'package:portuguese_job/nivel3/nivel3.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:portuguese_job/monteiro.dart';

void main() {
  runApp(new Main());
  FlutterStatusbarManager.setHidden(true, animation: StatusBarAnimation.NONE);
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: TelaInicial(),
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      routes: <String, WidgetBuilder>
      {
        '/telaInicial': (_) => new TelaInicial(),
        '/monteiroLobato': (_) => new Monteiro(),
        '/selecaoJogos': (_) => new TelaJogos(),
        '/nivel1': (_) => new Nivel1(),
        '/nivel2': (_) => new Nivel2(),
        '/nivel3': (_) => new Nivel3(),
      }
    );
  }
}

class TelaInicial extends StatelessWidget {
    Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("asset/fundos/fundo_inicial.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 570,
            left: 180,
            height: 170,
            child: Hero(
              tag: 'monteiro',
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/monteiroLobato');
                },
                child: Image.asset("asset/monteirinho.png"),
              ),
            ),
          ),
          Positioned(
            top: 317,
            left: 170,
            child: IconButton(
              icon: Icon(Icons.play_circle_filled, color:Colors.white, size: 70.0),
              onPressed: () {
                Navigator.pushNamed(context, '/selecaoJogos');
              },
            ),
          ),
          Positioned(
            top: 653,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.account_circle, color:Colors.white, size: 70.0),
              onPressed: () {
                Alert(
                    style: AlertStyle(
                      animationType: AnimationType.grow,
                      isCloseButton: false,
                      isOverlayTapDismiss: false,
                      alertBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.green, width: 3),
                      )
                    ),
                    context: context,
                    title: "DESENVOLVEDORES",
                    content: Column(
                      children: <Widget>[
                        Divider(color: Colors.black,),
                        Text("Programadores", textAlign: TextAlign.center,),
                        Text("Arthur Ramos\nLeandro Rodrigues", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.normal),),
                        Divider(),
                        Text("Design", textAlign: TextAlign.center,),
                        Text("Gabriela Pitaguari", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.normal),),
                        Divider(),
                        Text("Textos", textAlign: TextAlign.center,),
                        Text("Danilo Cervantes\nThiago Miranda", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.normal),),
                      ],
                    ),
                    buttons: [
                      DialogButton(
                        color: Colors.green,
                        child: Text(
                          "OKAY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {Navigator.pop(context);},
                      ),
                    ]
                  ).show();
              },
            ),
          ),
        ],
      ),
    );
  }
}

