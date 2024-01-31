import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // Imagem superior responsiva
        Image.asset(
          'images/lake.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        // Texto abaixo da imagem
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            'A Casa Branca (tradução literal do inglês: White House) é a residência oficial e principal local de trabalho do Presidente dos Estados Unidos, sendo, ao mesmo tempo, a sede oficial do poder executivo naquele país. Localiza-se na Avenida Pensilvânia, nº 1 600 em Washington D.C.',
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
              '110',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            '"Maria Rosário: "Local muito bem preservado',
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
