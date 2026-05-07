import 'package:flutter/material.dart';

class Animecard extends StatelessWidget {
  final String nome;
  final int nota;
  final String imagem;

  const Animecard({super.key,required this.nome,required this.nota,required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Card(

      color: const Color.fromARGB(255, 104, 54, 197),
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20
      ),

      child: ListTile(
        leading: Image.network(
          imagem,
          width: 100,
          height: 150,
          fit: BoxFit.cover,
        ),
      
        title: Text(nome, style: const TextStyle(
          color: Colors.white,
        )),
        subtitle: Text("Nota: $nota",style: TextStyle(
          color: Colors.yellow
        ),)
      ),
    );
  }
}