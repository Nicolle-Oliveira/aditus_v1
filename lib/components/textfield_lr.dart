// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  
  //Texto digitado no textfield
  final controller_val;
  //dica mostrada
  final String labelText_val;
  //esconder ou nao o conteudo
  final bool obscureText_val;

  const MyTextField({
    super.key,
    required this.controller_val,
    required this.labelText_val,
    required this.obscureText_val,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller_val,
        obscureText: obscureText_val,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
            enabledBorder: OutlineInputBorder(
              //borda se selecionar
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              //borda ao selecionar
              borderSide: BorderSide(color:Color.fromARGB(125, 0, 7, 55)),
            ),
            
            fillColor: Colors.grey.shade200,
            filled: true,

            labelText: labelText_val,
            labelStyle: TextStyle(color:  Color.fromARGB(150, 0, 7, 55))),
      ),
    );
  }
}