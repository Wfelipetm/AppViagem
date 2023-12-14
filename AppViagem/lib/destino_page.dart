import 'package:flutter/material.dart';

class DestinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Wallace'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Conteúdo da Página do Wallace o Destino aqui'),
            // Adicione elementos adicionais conforme necessário
          ],
        ),
      ),
    );
  }
}
