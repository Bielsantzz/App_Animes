import 'package:flutter/material.dart';

class DetalhesCard extends StatefulWidget {
  final String nome;
  final String descricao;
  final String imagem;
  final int avaliacao;
  final int index; // 👈 Adicionado aqui
  final Function(int, int) onAtualizarNota; // 👈 Adicionado aqui

  const DetalhesCard({
    super.key,
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.avaliacao,
    required this.index, // 👈 Obrigatório no construtor
    required this.onAtualizarNota, // 👈 Obrigatório no construtor
  });

  @override
  State<DetalhesCard> createState() => _DetalhesCardState();
}

class _DetalhesCardState extends State<DetalhesCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.imagem),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.descricao),
            ),
            Text("Nota Atual: ${widget.avaliacao}"),
            
            // Exemplo de como usar o botão para atualizar a nota de dentro dessa tela se você quiser:
            ElevatedButton(
              onPressed: () {
                int novaNotaExemplo = 5; 
                // Chama a função que veio lá da TelaHome passando os dados
                widget.onAtualizarNota(widget.index, novaNotaExemplo);
              },
              child: const Text("Mudar Nota para 5"),
            ),
          ],
        ),
      ),
    );
  }
}