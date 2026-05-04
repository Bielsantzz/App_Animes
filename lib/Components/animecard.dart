import 'package:flutter/material.dart';

class Animecard extends StatelessWidget {
  final String nome;
  final int nota;
  final String imagem;

  const Animecard({super.key,required this.nome,required this.nota,required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          imagem,
          width: 100,
          height: 150,
          fit: BoxFit.cover,
        ),
        title: Text(nome),
        subtitle: Text("Nota: $nota"),
      ),
    );
  }
}