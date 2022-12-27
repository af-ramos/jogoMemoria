import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:portuguese_job/nivel3/nivel3_item.dart';

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
  var tituloDialogo;
  var descricaoDialogo;

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
          'asset/nivel3/' + asset[index].substring(asset[index].length - 6);
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
            .toList()
        ),
        Positioned(
            width: 375,
            top: 12,
            left: 15,
            child: Text(
              "MEMÓRIAS DE EMÍLIA",
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

  void definirDialogo(var imagem)
  {
    if(imagem == "asset/nivel3/01.jpg")
    {
      tituloDialogo = "Emília";
      descricaoDialogo = "O livro gira em torno de uma história (possivelmente inventada por Emília) sobre um anjinho com a asa quebrada dentro do Sítio, após sua chegada, Emília decide raptá-lo e escondê-lo de todas as pessoas que vieram visitá-lo, gerando diversas intrigas entre os personagens, como Capitão Gancho, Peter Pan e Alice.";

    }
    if(imagem == "asset/nivel3/02.jpg")
    {
      tituloDialogo = "Visconde de Sabugosa";
      descricaoDialogo = "Visconde é responsável por escrever as 'Memórias de Emília' a pedido dela, porém ele escreve quase toda a obra sozinho, pois ela sai para resolver outras coisas, deixando ele sozinho 'trabalhando' em suas memórias.";
    }
    if(imagem == "asset/nivel3/03.jpg")
    {
      tituloDialogo = "Tia Nastácia";
      descricaoDialogo = "Uma das responsáveis pelo Sítio e uma exímia cozinheira, é responsável por criar Emília através de alguns trapos de panos para Narizinho e Pedrinho, participa ativamente da história cuidando do Sítio enquanto o clímax do enredo acontece.";
    }
    if(imagem == "asset/nivel3/04.jpg")
    {
      tituloDialogo = "Doutor Caramujo";
      descricaoDialogo = "O personagem é responsável por dar voz à Emília logo após ela ter sido criado por Tia Nástacia, que lhe receitou uma 'pílula falante', que acabou por não parar mais de falar.";
    }
    if(imagem == "asset/nivel3/05.jpg")
    {
      tituloDialogo = "Anjinho";
      descricaoDialogo = "Um anjo que teve sua asa quebrada durante uma viagem ao céu, e sua vinda ao Sítio chamou a atenção do mundo inteiro, que de longe veio vê-lo. Porém, após Emília raptá-lo, Visconde é colocado no lugar, o que não convence a maior parte das crianças, causando uma grande intriga entre os personagens.";
    }
    if(imagem == "asset/nivel3/06.jpg")
    {
      tituloDialogo = "Peter Pan";
      descricaoDialogo = "O personagem entra na história para tentar resolver a intriga entre os personagens, porém Pedrinho, se negando a ceder e entregar o Anjo, acaba por discutir com Peter Pan. Porém, após os personagens do Sítio cederem e entregarem o anjo, Peter Pan ajuda os protagonistas contra o Capitão Gancho.";
    }
    if(imagem == "asset/nivel3/07.jpg")
    {
      tituloDialogo = "Capitão Gancho";
      descricaoDialogo = "O personagem vem infiltrado junto aos marinheiros no navio com o objetivo de pegar o anjinho e levá-lo e render dinheiro em um circo em Londres, porém após um conflito com Popeye (que queria levá-lo para Hollywood), com Peter Pan, Alice, Emília e Pedrinho, Capitão Gancho perde e desiste de raptar o anjinho.";
    }
    if(imagem == "asset/nivel3/08.jpg")
    {
      tituloDialogo = "Alice";
      descricaoDialogo = "A personagem aparece junto com as crianças que vieram de navio para verem o anjinho, porém após perceber a intriga que acontecia no Sítio, ela se junta a Peter Pan para resolver isso, o que acaba em uma discussão com Emília. Mas no final, acaba por se juntar a eles contra o Capitão Gancho.";
    }
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
                    desc: "Parabéns, você acertou todos os pares de Memórias de Emília!",
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
