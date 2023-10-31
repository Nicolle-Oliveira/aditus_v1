// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ButtonLR extends StatelessWidget {
  
  //Funcao ao apertar o botao
  final Function()? onTap_val;
  //Esse botao está na teça de login?
  final bool login_val;

  const ButtonLR({
    super.key,
    required this.onTap_val,
    required this.login_val
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap_val,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 7, 55),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            login_val ? 'Entrar' : 'Registrar',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}