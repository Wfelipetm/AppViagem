import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peru'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // Imagem superior responsiva
        Image.asset(
          'images/peru.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        // Texto abaixo da imagem
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            'O Peru é um dos países mais diversificados do mundo. Um país multicultural, cheio de tradições, com uma laureada gastronomia e vastas reservas naturais. Possui 12 patrimônios mundiais reconhecidos pela Unesco e é dono de 84 dos 117 ecossistemas do mundo.',
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
              '59',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            '"Elaine Brito: "Viagem Maravilhosa',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            '"Alex Oliveira: "Voltarei com certeza',
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
              child: Text('América do Sul'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Ásia'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Oceania'),
            ),
          ],
        ),
      ),
    );
  }
}
