// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/button_lr.dart';
import '../../../components/textfield_lr.dart';
import '../../../services/auth/auth_service.dart';



class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    //chamar o auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Stack permite colocar os elementos do login em cima do background
        body: Stack(
      children: [
        //Background degrade
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color.fromARGB(255, 251, 252, 252),
                Color.fromARGB(255, 132, 143, 219),
              ],
            ),
          ),
        ),
        //Elementos do login
        SafeArea(
            child: SingleChildScrollView(
                child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              //Logo aditus
              Image.asset(
                'lib/images/logoAzul.png',
                height: 200,
              ),

              const SizedBox(height: 20),

              //Mensagem de welcome
              Text(
                'Bem vindo de volta!',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 7, 55),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Textfield email
              const SizedBox(height: 50),

              // email textfield
              MyTextField(
                controller_val: emailController,
                labelText_val: 'Email',
                obscureText_val: false,
              ),

              const SizedBox(height: 10),

              // senha textfield
              MyTextField(
                controller_val: passwordController,
                labelText_val: 'Senha',
                obscureText_val: true,
              ),

              const SizedBox(height: 50),

              // sign in button
              ButtonLR(
                onTap_val: signUserIn,
                login_val: true,
              ),

              const SizedBox(height: 25),

              // não possui cadastro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ainda não é um usuário?',
                    style: TextStyle(
                        color: Color.fromARGB(200, 0, 7, 55), fontSize: 15),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Registre',
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 2, 103),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )))
      ],
    ));
  }
}
