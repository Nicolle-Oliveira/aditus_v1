// ignore_for_file: prefer_const_constructors

import 'package:aditus_v1/components/my_button.dart';
import 'package:flutter/material.dart';

class HomePageS extends StatefulWidget {
  const HomePageS({super.key});

  @override
  State<HomePageS> createState() => _HomePageSState();
}

class _HomePageSState extends State<HomePageS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar com foto de perfil e nome do usuário surdo
      appBar: conteudoAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        Text(
                          "Você não possui chamadas agendadas!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 7, 25, 146),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyButton(
            onTap_val: () {},
            text_val: 'CHAMADA INSTANTÂNEA',
            icone_val: Icon(
              Icons.video_camera_front_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          MyButton(
            onTap_val: () {},
            text_val: 'AGENDAR UMA CHAMADA',
            icone_val: Icon(
              Icons.calendar_month_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

conteudoAppBar() => AppBar(
      backgroundColor: Color.fromARGB(255, 205, 207, 240),
      //Este Row possui a imagem e o nome
      title: Row(
        children: [
          Container(
            width: 60.0, // Largura desejada
            height: 60.0, // Altura desejada
            //Decoraçãozinha em volta da foto
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Color.fromARGB(255, 205, 207, 240)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
              shape: BoxShape.circle,
            ),
            //Foto em si
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://akamai.sscdn.co/uploadfile/letras/fotos/a/c/5/c/ac5cf7760bf3453f014dbff76247be8b.jpg',
              ),
            ),
          ),

          const SizedBox(width: 10), // Espaço entre a foto e o nome

          Text('Nome - Usuário surdo',
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 10, 77),
                  fontWeight: FontWeight
                      .w500)), // Substitua 'Seu Nome' pelo nome do usuário
        ],
      ),
      //Altura da AppBar
      toolbarHeight: 80,
    );
