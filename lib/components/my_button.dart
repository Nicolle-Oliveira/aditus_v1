// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //Funcao ao apertar o botao
  final Function()? onTap_val;
  //Texto do botão
  final String text_val;
  //Icone do botao
  final Icon icone_val;


  const MyButton({
    super.key,
    required this.onTap_val, 
    required this.text_val, 
    required this.icone_val, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap_val,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 89, 96, 205),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icone_val,
              const SizedBox(width: 8),
              Text(
                text_val,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
