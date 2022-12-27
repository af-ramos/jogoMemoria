import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'data.dart';
import 'page_transformer.dart';

class IntroPageItem extends StatelessWidget {
  IntroPageItem({
    @required this.item,
    @required this.pageVisibility,
  });

  final IntroItem item;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: Text(
        item.category,
        style: textTheme.caption.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 14.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

    var titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          item.title,
          style: textTheme.title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Positioned(
      child: Column(
        children: [
          categoryText,
          titleText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      item.imageUrl,
      fit: BoxFit.fill,
      alignment: FractionalOffset(
        0.5 + (pageVisibility.pagePosition / 3),
        0.5,
      ),
    );

    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 50, top: 50),
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: Material(
            elevation: 6.0,
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                image,
                imageOverlayGradient,
                _buildTextContainer(context),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 580,
          left: 108,
          child: RaisedButton(
            child: Text(
              item.buttonText,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Aller',
              ),
            ),
            color: Colors.green,
            onPressed: (){
              Navigator.pushNamed(context, item.urlButton);
            },
            padding: EdgeInsets.only(top:10.0, bottom:10.0, left: 30.0, right: 30.0),
          ),
        ),
      ],
    );
  }
}