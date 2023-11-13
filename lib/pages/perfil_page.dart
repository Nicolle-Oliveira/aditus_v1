import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/user_info_service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool isEditing = false;
  String biografia =
      "Escreva sobrre você!";

  void updateBiografia(String newBiografia) {
    setState(() {
      biografia = newBiografia;
    });
  }

  Widget buildRichText(String text) {
    final List<InlineSpan> children = [];
    final List<String> parts = text.split(":");
    if (parts.length == 2) {
      children.add(
        TextSpan(
          text: parts[0] + ": ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000A4D),
          ),
        ),
      );
      children.add(
        TextSpan(
          text: parts[1],
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      );
    } else {
      children.add(
        TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      );
    }
    return RichText(text: TextSpan(children: children));
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfo>(context, listen: false);

    return FutureBuilder<DocumentSnapshot?>(
      future: userInfo.getCurrentUserDocument(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('Nenhum documento encontrado'));
        } else {
          final userDocument = snapshot.data!;
          final data = userDocument.data() as Map<String, dynamic>?;

          if (data != null) {
            String nome = data['nome'] ?? 'Nome não encontrado';
            String sobrenome = data['sobrenome'] ?? 'Sobrenome não encontrado';
            String email = data['email'] ?? 'Email não encontrado';
            bool isVolunteer = data['isVoluntario'] ?? false;

            return Scaffold(
              body: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Color(0xFFCDCFF0),
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Color(0xFFCDCFF0)),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 177, 179, 216),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://akamai.sscdn.co/uploadfile/letras/fotos/a/c/5/c/ac5cf7760bf3453f014dbff76247be8b.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 4, color: Colors.white),
                                      color: Color(0xFF071992),
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Informações',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF000A4D),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: buildRichText("Nome: $nome"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: buildRichText("Sobrenome: $sobrenome"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: buildRichText("Email: $email"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: buildRichText(
                                  'É Voluntário: ${isVolunteer ? 'Sim' : 'Não'}'),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Biografia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF000A4D),
                              ),
                            ),
                            SizedBox(height: 10),
                            if (isEditing)
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Biografia:",
                                  hintText: "Digite sua biografia",
                                ),
                                initialValue: biografia,
                                onChanged: (value) {
                                  updateBiografia(value);
                                },
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            if (!isEditing)
                              Padding(
                                padding: EdgeInsets.only(left: 2),
                                child: buildRichText(biografia),
                              ),
                            SizedBox(height: 5),
                            if (!isEditing)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isEditing = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  shape: CircleBorder(),
                                  primary: Colors.white,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Color(0xFF34408E),
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (isEditing)
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditing =
                                            false; // Sair do modo de edição
                                      });
                                    },
                                    child: Text("CANCELAR"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                if (isEditing)
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditing =
                                            false; // Sair do modo de edição ao salvar
                                      });
                                      // Aqui você pode salvar a biografia, se necessário
                                    },
                                    child: Text("SALVAR"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF5960CD),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
