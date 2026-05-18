import 'dart:convert';
import 'package:app_animes/Components/animecard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/animecard.dart';
import '../components/appbar.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => Homepage();
}

class Homepage extends State<TelaHome> {
  List animes = [];

  @override
  void initState() {
    super.initState();
    carregarAnimes();
  }

  // GET - carregar animes da API
  Future<void> carregarAnimes() async {
    try {
      final url = Uri.parse("http://10.109.72.13:3000/animes");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          if (data is Map && data.containsKey("animes")) {
            animes = data["animes"];
          } else {
            animes = data;
          }
        });
      } else {
        print("Erro no servidor: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao conectar com API: $e");
    }
  }

  // UPDATE - editar nota via Dialog local
  void atualizarNota(int index) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Editar nota"),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Digite uma nota de 1 a 5",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () async {
                int? novaNota = int.tryParse(controller.text);

                if (novaNota != null && novaNota >= 1 && novaNota <= 5) {
                  final anime = animes[index];
                  final id = anime["id"];

                  try {
                    final url = Uri.parse("http://10.109.72.13:3000/animes/$id");
                    final response = await http.put(
                      url,
                      headers: {"Content-Type": "application/json"},
                      body: json.encode({
                        ...anime,
                        "avaliacao": novaNota,
                      }),
                    );

                    if (response.statusCode == 200) {
                      setState(() {
                        animes[index]["avaliacao"] = novaNota;
                      });
                      Navigator.pop(context);
                    } else {
                      print("Erro ao atualizar nota");
                    }
                  } catch (e) {
                    print("Erro: $e");
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("A nota deve ser entre 1 e 5")),
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
      appBar: const CustomAppBar(),
     body: animes.isEmpty
    ? const Center(
        child: CircularProgressIndicator(),
      )
    : ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes[index];

          return DetalhesCard(
            nome: anime["nome"],
            avaliacao: anime["avaliacao"],
            imagem: anime["imagem"],
            descricao: anime["descricao"],
            index: index, // Passa o índice da lista (0, 1, 2...)
            
            onAtualizarNota: (int idx, int novaNota) { // 👈 Tipado explicitamente como int
              setState(() {
                animes[idx]["avaliacao"] = novaNota;
              });
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: const Color.fromARGB(255, 104, 54, 197),
        child: const Center(
          child: Text(
            "© OtakuScore 2026",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}