// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/user_info_service.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

/*--------------------------NÃO MEXER--------------------------*/
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
            String nome = data['nome'] ?? 'Nome não encontrado';
            String sobrenome = data['sobrenome'] ?? 'Sobrenome não encontrado';
            String email = data['email'] ?? 'Email não encontrado';
            bool isVolunteer = data['isVoluntario'] ?? false;
/*--------------------------FIM DA ÁREA NÃO MEXER--------------------------*/
        
            //Aqui no scaffold pode :3
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 205, 207, 240),
                title: Text(
                  'Perfil',
                  style: TextStyle(
                    color: Color.fromARGB(255, 67, 69, 110),
                  ),
                ),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Nome: $nome'),
                    Text('Sobrenome: $sobrenome'),
                    Text('Email: $email'),
                    Text('É Voluntário: ${isVolunteer ? 'Sim' : 'Não'}'),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('Dados do usuário não encontrados'));
          }
        }
      },
    );
  }
}
