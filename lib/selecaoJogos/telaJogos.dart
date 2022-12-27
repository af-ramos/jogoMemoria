import 'package:flutter/material.dart';
import 'package:portuguese_job/main.dart';
import 'data.dart';
import 'intro_page_item.dart';
import 'page_transformer.dart';

class TelaJogos extends StatefulWidget
{
  @override
  TelaJogosState createState() => new TelaJogosState();
}

class TelaJogosState extends State<TelaJogos> with TickerProviderStateMixin
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/fundos/fundo_selecao.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: PageTransformer(
              pageViewBuilder: (context, visibilityResolver)
              {
                return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index)
              {
                final item = sampleItems[index];
                final pageVisibility = visibilityResolver.resolvePageVisibility(index);
                return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            width: 380,
            top: 17,
            left: 20,
            child: Text(
              "SELEÇÃO DE JOGOS",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(7),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              iconSize: 25,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()));
              },
            ),
          ),
        ],
      ),
    );
  }
}