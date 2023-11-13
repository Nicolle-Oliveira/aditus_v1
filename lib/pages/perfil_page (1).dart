import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool isObscurePassword = true;
  String biografia =
      "Olá, meu nome é Beatriz! Eu sou uma intérprete formada na UFMG";
  bool isEditing = false; // Variável para controlar o modo de edição

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
            color: Color(0xFF000A4D), // Cor do texto em negrito
          ),
        ),
      );
      children.add(
        TextSpan(
          text: parts[1],
          style: TextStyle(
            fontSize: 18,
            color: Colors.black, // Cor do texto normal
          ),
        ),
      );
    } else {
      children.add(
        TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0), // Cor do texto normal
          ),
        ),
      );
    }
    return RichText(text: TextSpan(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinhar à esquerda
            mainAxisAlignment:
                MainAxisAlignment.start, // Alinhar horizontalmente no início
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
                            border:
                                Border.all(width: 4, color: Color(0xFFCDCFF0)),
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
                                color: Color.fromARGB(255, 177, 179, 216),
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
                              border: Border.all(width: 4, color: Colors.white),
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
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Alinhar à esquerda
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Alinhar horizontalmente no início
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
                      padding:
                          EdgeInsets.only(left: 2), // Espaçamento à esquerda
                      child: buildRichText("Idade: 22"),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 2), // Espaçamento à esquerda
                      child: buildRichText("Região: MG, Brasil"),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 2), // Espaçamento à esquerda
                      child: buildRichText("Email: beatriz@gmail.com"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Biografia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF000A4D),
                      ),
                    ),
                    if (isEditing)
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Biografia:",
                          hintText: "Digite sua biografia",
                        ),
                        initialValue: biografia,
                        onChanged: (value) {
                          setState(() {
                            biografia = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    if (!isEditing)
                      Padding(
                        padding:
                            EdgeInsets.only(left: 2), // Espaçamento à esquerda
                        child: buildRichText(biografia),
                      ),
                    SizedBox(height: 5),
                    if (!isEditing)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditing = true; // Entrar no modo de edição
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
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isEditing)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditing = false; // Sair do modo de edição
                        });
                      },
                      child: Text("CANCELAR"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  if (isEditing)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditing = false; // Sair do modo de edição ao salvar
                        });
                        // Aqui você pode salvar a biografia, se necessário
                      },
                      child: Text("SALVAR"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5960CD),
                        padding: EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }
}
/*// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCDCFF0),
        title: Text(
          'Perfil',
          style: TextStyle(
            color: Color.fromARGB(255, 67, 69, 110),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
        child: Column(children: [Text('constroi depois sô')]),
      ))),

      /*Container(
        color: Colors.white,
        child: SingleChildScrollView(
          
          child: Column(
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
                            border: Border.all(width: 4, color: Color(0xFFCDCFF0)),
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
                                color: Color.fromARGB(255, 177, 179, 216),
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
                              border: Border.all(width: 4, color: Colors.white),
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
              SizedBox(height: 30),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildTextField("Idade", "22", false),
                    buildTextField("Região", "MG, Brasil", false),
                    buildTextField("Email:", "beatriz@gmail.com", false),
                    buildTextField(
                      "Biografia:",
                      "Olá, meu nome é Beatriz! Eu sou uma intérprete formada na UFMG",
                      false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centralize horizontalmente o botão "SALVAR"
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "SALVAR",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5960CD),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
    bool isPasswordTextField,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye,
                      color: Color.fromARGB(255, 106, 108, 151)),
                  onPressed: () {},
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 33, 31, 31),
          ),
        ),
      ),
    );
  }
}
*/
