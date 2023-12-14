import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon? icon; // Aceita um ícone opcional

  const NavBarItem({required this.title, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (icon != null) icon!, // Adiciona o ícone se fornecido
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
