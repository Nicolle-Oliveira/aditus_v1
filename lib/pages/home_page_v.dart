// ignore_for_file: prefer_const_constructors

import 'package:aditus_v1/components/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../readData/get_user_name.dart';

class HomePageV extends StatefulWidget {
  const HomePageV({super.key});

  @override
  State<HomePageV> createState() => _HomePageVState();
}

class _HomePageVState extends State<HomePageV> {
  //Docs Ids
  List<String> docsIds = [];

  //get DocsIds
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docsIds.add(document.reference.id);
          }),
        );
  }

  Future<String> getCurrentUserId() async {
    await getDocId(); // Aguarde o preenchimento da lista docsIds

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      for (var i = 0; i < docsIds.length; i++) {
        if (docsIds[i] == user.uid) {
          return docsIds[i];
        }
      }
    }
    return 'Nenhum usuário encontrado';
  }

  @override
  Widget build(BuildContext context) {
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
            FutureBuilder(
              future: getCurrentUserId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GetUserName(documentId: snapshot.data.toString());
                } else {
                  return Text('loading...');
                }
              },
            ),
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
            onTap_val: () {},
            text_val: 'AGENDAMENTOS CONFIRMADOS',
            icone_val: Icon(
              Icons.alarm_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          MyButton(
            onTap_val: () {},
            text_val: 'PEDIDOS DE AGENDAMENTO',
            icone_val: Icon(
              Icons.assignment_turned_in_rounded,
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


/*MyButton(
            onTap_val: () {},
            text_val: 'AGENDAMENTOS CONFIRMADOS',
            icone_val: Icon(
              Icons.alarm_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          MyButton(
            onTap_val: () {},
            text_val: 'PEDIDOS DE AGENDAMENTO',
            icone_val: Icon(
              Icons.assignment_turned_in_rounded,
              size: 30,
              color: Colors.white,
            ),
          ), */