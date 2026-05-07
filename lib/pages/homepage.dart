import 'package:flutter/material.dart';
import '../components/animecard.dart';
import '../components/appbar.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),

      /* cards com o nome e nota dos animes */
      body: ListView(
        children: const [
          Animecard(
            nome: "Naruto",
            nota: 2,
            imagem:
                "https://br.web.img3.acsta.net/pictures/16/04/11/16/56/089875.jpg",
          ),

          Animecard(
            nome: "Demon Slayer",
            nota: 4,
            imagem:
                "https://m.media-amazon.com/images/I/71r8Wf5h0+L._AC_UF1000,1000_QL80_.jpg",
          ),

          Animecard(
            nome: "Attack on Titan",
            nota: 5,
            imagem:
                "https://i5.walmartimages.com/asr/e74beab2-37a6-44a4-ac5c-b6f3d222bc35.968a847bd29fb37646da893eb1142793.jpeg",
          ),

          Animecard(
            nome: "One Punch Man",
            nota: 3,
            imagem:
                "https://m.media-amazon.com/images/M/MV5BNzMwOGQ5MWItNzE3My00ZDYyLTk4NzAtZWIyYWI0NTZhYzY0XkEyXkFqcGc@._V1_.jpg",
          ),

          Animecard(
            nome: "Jujutsu Kaisen",
            nota: 1,
            imagem:
                "https://images.justwatch.com/poster/335665389/s718/temporada-1.jpg",
          ),

          Animecard(
            nome: "Dragon Ball",
            nota: 5,
            imagem:
                "https://m.media-amazon.com/images/M/MV5BNmFiM2FkYTYtY2FiOS00ZWJkLTkyOTgtNmFmODI4NjcwNDgzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
          ),

          Animecard(
            nome: "Nanatsu no Taizai",
            nota: 2,
            imagem:
                "https://static.wikia.nocookie.net/nanatsu-no-taizai/images/2/25/Nanatsu_no_Taizai_Anime_Fourth_Season_Poster.png/revision/latest?cb=20200805045531",
          ),

          Animecard(
            nome: "Tokyo Revengers",
            nota: 5,
            imagem:
                "https://m.media-amazon.com/images/S/pv-target-images/fae0ec8ee88ff95ae99d2f8f2f305130275976318227921bdc7c7f185379e33a.jpg",
          ),

          Animecard(
            nome: "Death Note",
            nota: 4,
            imagem:
                "https://i5.walmartimages.com/asr/c7e18a49-2e0b-42be-943a-74502a155b32.6945a5cce9c9c47cd6745f76d6796b31.jpeg",
          ),

          Animecard(
            nome: "Pokemon",
            nota: 3,
            imagem:
                "https://wallpapers.com/images/hd/pokemon-pictures-fw1l53kqy2o4e5p1.jpg",
          ),

          // NOVOS ANIMES

          Animecard(
            nome: "Boku no Hero",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Yu-Gi-Oh!",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Bleach",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Neon Genesis Evangelion",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Blue Lock",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Black Clover",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Diário de uma Apothecaria",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "A Silent Voice",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Your Name",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Dan Da Dan",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Kakegurui",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Nagatoro",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "Komi Can't Communicate",
            nota: 0,
            imagem: "",
          ),

          Animecard(
            nome: "The Promised Neverland",
            nota: 0,
            imagem: "",
          ),
        ],
      ),

      /* rodapé */
      bottomNavigationBar: Container(
        height: 50,
        color: const Color.fromARGB(255, 104, 54, 197),
        child: const Center(
          child: Text(
            "© OtakuScore 2026",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}