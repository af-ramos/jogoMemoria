import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:portuguese_job/nivel1/nivel1_item.dart';

class CardBoard extends StatefulWidget {
  final Function() onWin;

  const CardBoard({Key key, this.onWin}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CardBoardState();
  }
}

class CardBoardState extends State<CardBoard> {
  List<int> openedCards = [];
  List<CardModel> cards;
  var descricaoDialogo;
  var tituloDialogo;

  @override
  void initState() {
    super.initState();
    cards = createCards();
  }

  List<CardModel> createCards() {
    List<String> asset = [];
    List(8).forEach((f) => asset.add('0${(asset.length + 1)}.jpg'));
    List(8).forEach((f) => asset.add('0${(asset.length - 8 + 1)}.jpg'));
    return List(16).map((f) {
      int index = Random().nextInt(1000) % asset.length;
      String _image =
          'asset/nivel1/' + asset[index].substring(asset[index].length - 6);
      asset.removeAt(index);
      return CardModel(
          id: 16 - asset.length - 1, image: _image, key: UniqueKey());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GridView.count(
        padding: EdgeInsets.only(top:130),
        shrinkWrap: true,
        crossAxisCount: 4,
        childAspectRatio: 300 / 390,
        children: cards
            .map((f) =>
            CardItem(key: f.key, model: f, onFlipCard: handleFlipCard))
            .toList()),
        Positioned(
            width: 380,
            top: 12,
            left: 18,
            child: Text(
              "REINAÇÕES DE NARIZINHO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Container(
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              iconSize: 25,
              onPressed: () {
                Navigator.pushNamed(context, '/selecaoJogos');
              },
            ),
        ),
      ],
    );
  }

  void handleFlipCard(bool isOpened, int id) {
    cards[id].isNeedCloseEffect = false;

    checkOpenedCard(isOpened);

    if (isOpened) {
      setCardOpened(id);
      openedCards.add(id);
    } else {
      setCardNone(id);
      openedCards.remove(id);
    }

    checkWin();
  }

  void checkOpenedCard(bool isOpened) {
    if (openedCards.length == 2 && isOpened) {
      cards[openedCards[0]].isNeedCloseEffect = true;
      setCardNone(openedCards[0]);
      cards[openedCards[1]].isNeedCloseEffect = true;
      setCardNone(openedCards[1]);
      openedCards.clear();
    }
  }

  void definirDialogo(var imagem)
  {
    if(imagem == "asset/nivel1/01.jpg")
    {
      tituloDialogo = "Narizinho";
      descricaoDialogo = "Durante um passeio rotineiro pelo sítio, Narizinho vai dar comida aos peixes no ribeirão que passa no fundo do pomar, quando ela de repente se depara com o Príncipe Escamado, que a leva para conhecer o Reino das Águas Claras.";

    }
    if(imagem == "asset/nivel1/02.jpg")
    {
      tituloDialogo = "Visconde de Sabugosa";
      descricaoDialogo = "Neste livro é mostrado a origem de Visconde, do qual as crianças (Narizinho e Pedrinho) o fazem com um sabugo de milho com o objetivo de ser o pai de Rabicó. Ele ficou sábio após ter sido esquecido em meio aos livros e é feito de escravo por Emília.";
    }
    if(imagem == "asset/nivel1/03.jpg")
    {
      tituloDialogo = "Dona Benta";
      descricaoDialogo = "É a avó de Narizinho e Pedrinho e grande amiga de Tia Nastácia. De origem europeia, é uma ótima contadora de histórias sobre o mundo. De início não acreditava nas histórias dos netos, até ver Emília falar.";
    }
    if(imagem == "asset/nivel1/04.jpg")
    {
      tituloDialogo = "Tia Nastácia";
      descricaoDialogo = "A companheira de Dona Benta e Narizinho no sítio, foi quem fez a boneca Emília para a garota. Em umas das aventuras, quando o povo do Reino das Águas Claras vai visitar o sítio ela acidentalmente acaba cozinhando um dos habitantes do reino.";
    }
    if(imagem == "asset/nivel1/05.jpg")
    {
      tituloDialogo = "Rabicó";
      descricaoDialogo = "Marido de Emília, o porquinho acompanha Narizinho e Emília a uma nova ida ao reino, onde dessa vez eles são convidados a ir conhecer o Reino das Abelhas, onde rabicó não consegue chegar, pois foge de um quase assalto de Tom Mix que era um ladrão Burro.";
    }
    if(imagem == "asset/nivel1/06.jpg")
    {
      tituloDialogo = "Príncipe Escamado";
      descricaoDialogo = "Durante a visita da boneca Emília e Narizinho ao Reino das Águas Claras, ele se apaixona pela garota e decide que quer se casar com ela, o casamento acaba tendo dificuldades de ocorrer por diversos problemas.";
    }
    if(imagem == "asset/nivel1/07.jpg")
    {
      tituloDialogo = "Conselheiro";
      descricaoDialogo = "É um burro com a habilidade de falar, foi resgatado por Narizinho no País das Fábulas, prestes a ser condenado a morrer pelo Rei Leão, que o considerava uma ameaça. Foi levado para o Sítio e nomeado de Conselheiro, por Emília, por seus ótimos conselhos.";
    }
    if(imagem == "asset/nivel1/08.jpg")
    {
      tituloDialogo = "Dona Aranha";
      descricaoDialogo = "É uma personagem de mais de mil anos, sendo a costureira real do Reino das Águas Claras. É ela que confecciona as principais roupas vistas nas histórias do Sítio, e além disso, foi a responsável por fazer o vestido de Narizinho para seu casamento com o Príncipe Escamado.";
    }
  }

  void checkWin() {
    if (openedCards.length == 2) {
      if (cards[openedCards[0]].image == cards[openedCards[1]].image) {
        definirDialogo(cards[openedCards[0]].image);
        Alert(
          style: AlertStyle(
            animationType: AnimationType.grow,
            isCloseButton: false,
            isOverlayTapDismiss: false,
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.green, width: 3),
            ),
          ),
          context: context,
          title: tituloDialogo,
          desc: descricaoDialogo,
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
              onPressed: () {
                Navigator.pop(context);
                if(verificarVitoria())
                {
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
                    title: "VOCÊ GANHOU!",
                    desc: "Parabéns, você acertou todos os pares de Reinações de Narizinho!",
                    buttons: [
                      DialogButton(
                        color: Colors.green,
                        child: Text(
                          "YEY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil('/selecaoJogos', (Route<dynamic> route) => false);
                        },
                      ),
                    ]
                  ).show();
                }
              },
            ),
          ],
        ).show();
        setCardWin(openedCards[0]);
        setCardWin(openedCards[1]);
        openedCards.clear();
        widget.onWin();
      }
      else
      {
        cards[openedCards[0]].isNeedCloseEffect = true;
        setCardNone(openedCards[0]);
        cards[openedCards[1]].isNeedCloseEffect = true;
        setCardNone(openedCards[1]);
        openedCards.clear();
      }
    }
  }

  bool verificarVitoria()
  {
    for(int i = 0; i<16; i++)
    {
      if(cards[i].status == ECardStatus.None)
      {
        return false;
      }
    }
    return true;
  }

  void setCardNone(int id) {
    setState(() {
      cards[id].status = ECardStatus.None;
      cards[id].key = UniqueKey();
    });
  }

  void setCardOpened(int id) {
    setState(() {
      cards[id].status = ECardStatus.Opened;
      cards[id].key = UniqueKey();
    });
  }

  void setCardWin(int id) {
    setState(() {
      cards[id].status = ECardStatus.Win;
      cards[id].key = UniqueKey();
    });
  }
}
