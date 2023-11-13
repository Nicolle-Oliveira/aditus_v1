// ignore_for_file: prefer_const_constructors, unused_local_variable, empty_statements, dead_code

import 'package:aditus_v1/components/my_button.dart';
import 'package:aditus_v1/pages/call_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/user_info_service.dart';

class HomePageS extends StatefulWidget {
  const HomePageS({super.key});

  @override
  State<HomePageS> createState() => _HomePageSState();
}

class _HomePageSState extends State<HomePageS> {
  //Docs Ids
  List<String> docsIds = [];

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<CurrentUserInfo>(context, listen: false);
        
    return FutureBuilder<DocumentSnapshot?>(
      future: userInfo.getCurrentUserDocument(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Exibe um indicador de carregamento enquanto a Future não foi concluída.
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Lida com erros, se houver.
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          // Lida com o caso em que o userDocument é nulo.
          return Center(child: Text('Nenhum documento encontrado'));
        } else {
          // Acessa os dados do documento após a conclusão da Future.
          final userDocument = snapshot.data!;
          final data = userDocument.data() as Map<String, dynamic>?;

          if (data != null) {
            final id = data['uid'];
            String nome = data['nome'] ?? 'Nome não encontrado';
            String email = data['email'] ?? 'Email não encontrado';
            bool isVolunteer = data['isVoluntario'] ?? false;
/*--------------------------FIM DA ÁREA NÃO MEXER--------------------------*/
        
          return Scaffold(
      //[------App bar com foto de perfil e nome do usuário surdo------]
      appBar: AppBar(
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

            //Mostrar o nome do user :)
            Text(
                isVolunteer
                    ? '$nome - Intérprete'
                    : '$nome - Usuário Surdo',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 10, 77),
                    fontWeight: FontWeight.w500)),
            
            
          ],
        ),
        //Altura da AppBar
        toolbarHeight: 80,
      ),

      //[------Body da página------]
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
            onTap_val: () {
            Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => CallPage(callID: 'call_ladadee', userID: id, userName: nome,)),
);

          },
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
    ); } else {
            return Center(child: Text('Dados do usuário não encontrados'));
          };
  }});}}