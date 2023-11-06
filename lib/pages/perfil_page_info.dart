// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
