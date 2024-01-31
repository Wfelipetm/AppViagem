import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('China'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // Imagem superior responsiva
        Image.asset(
          'images/china.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        // Texto abaixo da imagem
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            'A China é um país localizado no continente asiático, especificamente na Ásia Oriental. É oficialmente chamada República Popular da China e é considerada uma das mais antigas civilizações do mundo. O país é o terceiro maior do mundo quando o assunto é extensão territorial (área terrestre) e também o mais populoso..',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
        ),
        // Ícone de like com numeração
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, color: Colors.red),
            SizedBox(width: 5),
            Text(
              '70',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            '"Jean Silva: "Cultura Fascinante',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Europa'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Asia'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('América do Sul'),
            ),
          ],
        ),
      ),
    );
  }
}
