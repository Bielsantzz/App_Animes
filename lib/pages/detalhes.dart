import 'package:flutter/material.dart';

class Detalhes extends StatefulWidget {
  final String nome;
  final String descricao;
  final String imagem;
  final int avaliacao;

  final int index;
  final Function(int, int) onAtualizarNota;

  const Detalhes({
    super.key,
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.avaliacao,
    required this.index,
    required this.onAtualizarNota,
  });

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  late int notaAtual;

  @override
  void initState() {
    super.initState();
    notaAtual = widget.avaliacao;
  }

  void editarNota() {
    TextEditingController controller =
        TextEditingController(text: notaAtual.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Editar nota"),

          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Digite de 1 a 5",
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),

            ElevatedButton(
              onPressed: () {
                int? novaNota = int.tryParse(controller.text);

                if (novaNota != null &&
                    novaNota >= 1 &&
                    novaNota <= 5) {

                  setState(() {
                    notaAtual = novaNota;
                  });

                  widget.onAtualizarNota(
                    widget.index,
                    novaNota,
                  );

                  Navigator.pop(context);

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Digite uma nota de 1 a 5"),
                    ),
                  );
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 104, 54, 197),
        iconTheme: const IconThemeData(
          color: Colors.white),
        title: Text(
          widget.nome,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(widget.imagem,width: 220,height: 320,fit: BoxFit.cover),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                widget.nome,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 20),

              Text(
                widget.descricao,
                style: const TextStyle(color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Avaliação: $notaAtual/5 ⭐",
                    style: const TextStyle(color: Colors.yellow,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 10),

                  IconButton(onPressed: editarNota,icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}