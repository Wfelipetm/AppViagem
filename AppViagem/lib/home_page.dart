import 'package:flutter/material.dart';

import 'destino_page.dart';
import 'nav_bar_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Mundo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DestinoPage()),
                );
              },
              child: SizedBox(
                height: 450.0, // Ajuste o valor conforme necessário
                child: Container(
                  width: double.infinity,
                  child: Image.network(
                    'https://images.pexels.com/photos/753772/pexels-photo-753772.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarItem(
                  title: 'Telefone',
                  onTap: () {
                    // Implemente a navegação ou ação de telefone conforme necessário
                  },
                  icon: Icon(Icons.phone), // Ícone de telefone
                ),
                NavBarItem(
                  title: 'Compartilhar',
                  onTap: () {
                    // Implemente a navegação ou ação de compartilhar conforme necessário
                  },
                  icon: Icon(Icons.share), // Ícone de compartilhar
                ),
                // Adicione mais itens conforme necessário
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Escreva...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Adicione um widget para exibir avaliações de clientes e interações
            // Pode ser uma lista de avaliações, botões interativos, etc.
          ],
        ),
      ),
    );
  }
}
