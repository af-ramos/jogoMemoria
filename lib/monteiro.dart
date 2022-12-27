import 'package:flutter/material.dart';

class Monteiro extends StatelessWidget {
    Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
            SliverAppBar(
              expandedHeight: 280.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Monteiro Lobato",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                background: Container(
                  child: Hero(
                    tag: 'monteiro',
                    child: Image.asset(
                      'asset/monteirinho2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "BIOGRAFIA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ), 
              ),  
            ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 70, left: 0),
                  child: Text(
                    "Quem foi?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Text(
                    "Monteiro Lobato (1882-1948) foi um escritor e editor brasileiro. 'O Sítio do Pica-pau Amarelo' é sua obra de maior destaque na literatura infantil. Foi um dos primeiros autores de literatura infantil de nosso país e de toda América Latina. Destaca-se pelo caráter nacionalista e social. Situa-se entre os autores do Pré-Modernismo, período que precedeu a Semana de Arte Moderna.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 0),
                  child: Text(
                    "Infância e Formação",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Text(
                    "Monteiro Lobato (1882-1948) nasceu em Taubaté, São Paulo, no dia 18 de abril de 1882. Desde menino já mostrava seu temperamento irrequieto. Com 13 anos foi estudar em São Paulo, no Instituto de Ciências e Letras, se preparando para a faculdade de Direito. \n\nIngressou na Faculdade de Direito do Largo de São Francisco na capital, formando-se em 1904. Na festa de formatura fez um discurso tão agressivo que vários professores, padres e bispos se retiraram da sala. \n\nMonteiro Lobato casou-se com Maria Pureza da Natividade, em 28 de março de 1908. Com ela teve quatro filhos, Marta (1909), Edgar (1910), Guilherme (1912) e Rute (1916). Paralelamente ao cargo de Promotor, escrevia para vários jornais e revistas, fazia desenhos e caricaturas.",
                    style: TextStyle(
                      fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                  padding: EdgeInsets.only(top: 15, left: 0),
                  child: Text(
                    "Publicações Polêmicas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Text(
                    "No dia 12 de novembro de 1912, o jornal O Estado de São Paulo publicou uma carta sua enviada à redação, intitulada 'Velha Praga', onde destaca a ignorância do caboclo, criticando as queimadas e que a miséria tornava incapaz o desenvolvimento da agricultura na região. Mais tarde, publica novo artigo 'Urupês', onde aparece pela primeira vez o personagem 'Jeca Tatu'. \n\nNo dia 20 de dezembro de 1917, publicou no jornal O Estado de São Paulo, um artigo intitulado 'Paranoia ou Mistificação?', onde critica a exposição de Anita Malfatti, pintora paulista recém chegada da Europa.",
                    style: TextStyle(
                      fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                  padding: EdgeInsets.only(top: 15, left: 0),
                  child: Text(
                    "Literatura Infantil",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Text(
                    "Publica em 1918, seu primeiro livro 'Urupês', que esgota em sucessivas tiragens. Lobato muda-se para o Rio de Janeiro e começa a publicar livros para crianças. Em 1921 publica 'Narizinho Arrebitado', livro de leitura para as escolas. A obra fez grande sucesso, o que levou o autor a prolongar as aventuras de seu personagem em outros livros girando todos ao redor do 'Sítio do Pica-pau Amarelo'. \n\nComo escritor literário, Lobato destacou-se no gênero 'conto'. Em seu livro 'Urupês', que foi sua estreia na literatura, Lobato criou a figura do 'Jeca Tatu', símbolo do caipira brasileiro. As histórias do 'Sítio do Pica-pau Amarelo', e seus habitantes, Emília, Dona Benta, Pedrinho, Tia Anastácia, Narizinho, Rabicó e tantos outros, misturam a realidade e a fantasia usando uma linguagem coloquial e acessível. \n\nJosé Renato Monteiro Lobato ou José Bento Monteiro Lobato faleceu em São Paulo, no dia 5 de julho de 1948, de problemas cardíacos.",
                    style: TextStyle(
                      fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                  padding: EdgeInsets.only(top: 15, left: 0),
                  child: Text(
                    "Jeca Tatu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Text(
                    "É no livro 'Urupês', que Monteiro Lobato retrata a imagem do caipira brasileiro, onde destaca a pobreza e a ignorância do caboclo, que o tornava incapaz de auxiliar na agricultura. O Jeca Tatu é um flagrante do homem e da paisagem do interior. Na quarta edição do livro, Lobato pede desculpas ao homem do interior.",
                    style: TextStyle(
                      fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                  padding: EdgeInsets.only(top: 15, left: 0),
                  child: Text(
                    "Principais Obras",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 60, bottom: 15),
                  child: Text(
                    "Ideias de Jeca Tatu, 1918 \nUrupês, 1918 \nCidades Mortas, 1920\nNegrinha, 1920\nO Saci, 1921\nFábulas de Narizinho, 1921\nNarizinho Arrebitado, 1921\nO Marquês de Rabicó, 1922\nO Macaco que se fez Homem, 1923\nMundo da Lua, 1923\nCaçadas de Hans Staden, 1927\nPeter Pan, 1930\nReinações de Narizinho, 1931\nViagem ao Céu, 1931\nCaçadas de Pedrinho, 1933\nEmília no País da Gramática, 1934\nHistória das Invenções, 1935\nMemórias da Emília, 1936\nHistórias de Tia Nastacia, 1937\nSerões de Dona Benta, 1937\nO Pica-pau Amarelo, 1939",
                    style: TextStyle(
                      fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

