import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:portuguese_job/nivel2/nivel2_item.dart';

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
          'asset/nivel2/' + asset[index].substring(asset[index].length - 6);
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
            width: 375,
            top: 12,
            left: 18,
            child: Text(
              "CAÇADAS DE PEDRINHO",
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
    if(imagem == "asset/nivel2/01.jpg")
    {
      tituloDialogo = "Narizinho";
      descricaoDialogo = "Ao saber da novidade vinda de Rabicó, fica assustada e incentiva Pedrinho a contar o que sabe para Dona Benta e Tia Nastácia, mas é impedida pelo garoto que já prevê a reação protetora delas e teme ser impedido de seu plano. Narizinho não era tão valente como queria demonstrar, mas não aceitava ser vista como frágil ou medrosa, e assim topou entrar no plano do irmão.";
    }
    if(imagem == "asset/nivel2/02.jpg")
    {
      tituloDialogo = "Visconde de Sabugosa";
      descricaoDialogo = "É um dos convocados de Pedrinho para participar da caçada contra a onça que rondava o Sítio. Ao começar a caçada, ficou com muito medo igual a todos ali, mas não recuou no plano e conseguiu atordoar a onça e leva-la até Dona Benta, que esperava, sem saber o que acontecia, em seu Sítio.";
    }
    if(imagem == "asset/nivel2/03.jpg")
    {
      tituloDialogo = "Dona Benta";
      descricaoDialogo = "Dona Benta começava a ficar aflita com o sumiço das crianças, que já estavam fora por uma tarde inteira, a aflição só aumentou quando avistaram a onça e se deram conta do perigo em que as crianças se puseram. Mas essa aflição de Dona Benta tinha apenas começado, mal sabiam onde as crianças de fato estavam se metendo.";
    }
    if(imagem == "asset/nivel2/04.jpg")
    {
      tituloDialogo = "Rabicó";
      descricaoDialogo = "Rabicó é o que dá início a história, quando resolveu se aventurar pela mata do o capoeirão dos Taquaruçus e teve uma surpresa desagradável como ele jamais imaginara: ouvira rastos e miados de gato, mas muito mais fortes e altos do que um simples gatinho seria capaz de produzir. Para ele, apenas um gato gigante seria capaz de fazer todo aquele barulho, concluindo assim que só poderia se tratar de uma onça.";
    }
    if(imagem == "asset/nivel2/05.jpg")
    {
      tituloDialogo = "Pedrinho";
      descricaoDialogo = "É o primeiro que Rabicó conta sobre o acontecimento no capoeirão, e com toda sua imaginação fértil que corre em busca de aventuras, resolve que deve caçar o bicho com os seus amigos.";
    }
    if(imagem == "asset/nivel2/06.jpg")
    {
      tituloDialogo = "Onça";
      descricaoDialogo = "Morta pelas crianças do Sítio, a Onça foi o motivo para a guerra fria entre o Sítio e os animais da floresta, ao machucarem e matarem o pobre animal, as crianças deixaram os animais amigos da Onça enraivecidos, fazendo com que eles armassem um ataque no local onde todos os humanos estavam: o Sítio. Após um tempo de brigas, a paz é reestabelecida por Quindim. ";
    }
    if(imagem == "asset/nivel2/07.jpg")
    {
      tituloDialogo = "Quindim";
      descricaoDialogo = "Enquanto a guerra fria era travada entre as crianças e animais, um rinoceronte acaba por fugir do circo, e encontra no sítio um local para se abrigar e buscar tranquilidade. Após muitos sustos e desconfianças, as crianças passaram a brincar com o animal e a entender que ele não era um inimigo infiltrado. As crianças então se apropriam do animal e ele passa a ser um novo amigo delas, ajudando-as a resolver o problema que criaram com os animais do capoeirão, esse é o novo amigo, Quindim.";
    }
    if(imagem == "asset/nivel2/08.jpg")
    {
      tituloDialogo = "Emília";
      descricaoDialogo = "Foi a outra amiga que Pedrinho e Narizinho pediram para que se juntasse na aventura dentro do capoeirão. Após o sucesso da caçada, voltou para casa com todos os amigos. Por sorte, Emília havia feito amizade com um casal de besouros que ouviram o plano dos outros animais de realizar uma guerra por conta da morte da onça. Ao tomarem conhecimento da gravidade da situação, prontamente avisaram a boneca do que estava por vir.";
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
                    desc: "Parabéns, você acertou todos os pares de Caçadas de Pedrinho!",
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

  void setCardWin(int id) {
    setState(() {
      cards[id].status = ECardStatus.Win;
      cards[id].key = UniqueKey();
    });
  }
}
