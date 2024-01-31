import 'package:flutter/material.dart';

import 'componentes/hamburguer/gaveta_mapa_hamburguer.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VaiDViagem',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold), // Cor e negrito do texto
        ),
        backgroundColor:
            Colors.transparent, // Torna a barra de navegação transparente
        elevation: 0, // Remove a sombra da barra de navegação
        iconTheme: IconThemeData(color: Colors.white), // Cor do ícone de menu
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green], // Cores do degradê
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logotipo na parte superior
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                'assets/images/usuar.png', // Substitua pelo caminho do seu logotipo
                height: 200,
                width: 200,
              ),
            ),
            // Parágrafo explicativo em negrito
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'A nossa agência de viagens, chamada VaiD Viagem, é uma porta de entrada para aventuras inesquecíveis.'
                ' O que nos diferencia é a nossa paixão por criar roteiros personalizados que vão além do convencional.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // Negrito e cor branca
              ),
            ),
            SizedBox(
                height:
                    40), // Espaçamento entre o parágrafo e as informações de contato
            // Informações de contato no rodapé
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10),
                      Text(
                        '+55 90000-0000', // Seu número de telefone
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 10),
                      Text(
                        'VaiDViagens@outlook.com', // Seu endereço de e-mail
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: GavetaMap(
        // Ajuste as propriedades e métodos conforme necessário
        onLogout: () {
          // Adicione a lógica de logout aqui
        },
        onNavigateToSomeRoute: () {
          // Adicione a lógica de navegação para alguma rota aqui
        },
        onNewButtonAction: () {
          // Adicione a lógica da ação do novo botão aqui
        },
      ),
    );
  }
}
