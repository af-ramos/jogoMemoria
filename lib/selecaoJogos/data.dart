class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
    this.buttonText,
    this.urlButton,
  });

  final String title;
  final String category;
  final String imageUrl;
  final String buttonText;
  final String urlButton;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: '', category: '', imageUrl: 'asset/fundos/fundo_narizinho.jpg', buttonText: 'Jogar', urlButton: '/nivel1'),
  new IntroItem(title: '', category: '', imageUrl: 'asset/fundos/fundo_pedrinho.jpg', buttonText: 'Jogar', urlButton: '/nivel2'),
  new IntroItem(title: '', category: '', imageUrl: 'asset/fundos/fundo_emilia.jpg', buttonText: 'Jogar', urlButton: '/nivel3'),
];