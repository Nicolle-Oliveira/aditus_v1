// ignore_for_file: prefer_const_constructors

import 'package:aditus_v1/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/button_lr.dart';
import '../../../components/textfield_lr.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register-page';
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nomeController = TextEditingController(); //Conteudo nome
  final sobrenomeController = TextEditingController(); //sobrenome
  final emailController = TextEditingController(); //email
  final passwordController = TextEditingController(); //senha
  final confirmPasswordController =
      TextEditingController(); //confirmação de senha
  bool isVoluntario = false;

  void signUserUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('As senhas não combinam')));
      return;
    }

    //chamar auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
          emailController.text.trim(),
          passwordController.text.trim(),
          nomeController.text.trim(),
          sobrenomeController.text,
          isVoluntario);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    sobrenomeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Stack permite colocar os elementos do login em cima do background
      body: Stack(children: [
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
                  const SizedBox(height: 100),

                  // titulo
                  Text(
                    'Criar uma conta',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 7, 55),
                      //rgb(0, 7, 55)
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // username textfield
                  MyTextField(
                    controller_val: nomeController,
                    labelText_val: 'Nome',
                    obscureText_val: false,
                  ),

                  const SizedBox(height: 10),

                  MyTextField(
                    controller_val: sobrenomeController,
                    labelText_val: 'Sobrenome',
                    obscureText_val: false,
                  ),

                  const SizedBox(height: 10),

                  MyTextField(
                    controller_val: emailController,
                    labelText_val: 'Email',
                    obscureText_val: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller_val: passwordController,
                    labelText_val: 'Senha',
                    obscureText_val: true,
                  ),

                  const SizedBox(height: 10),

                  // confirm password textfield
                  MyTextField(
                    controller_val: confirmPasswordController,
                    labelText_val: 'Confirme sua senha',
                    obscureText_val: true,
                  ),

                  const SizedBox(height: 7),

                  //checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 0, 7, 55)),
                        value: isVoluntario,
                        onChanged: (bool? value) {
                          setState(() {
                            isVoluntario = value!;
                          });
                        },
                      ),
                      Text(
                        'Sou intérprete',
                        style: TextStyle(
                            color: Color.fromARGB(200, 0, 7, 55),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // sign up button
                  ButtonLR(
                    onTap_val: signUserUp,
                    login_val: false,
                  ),

                  const SizedBox(height: 25),

                  // já possui conta?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já tem uma conta?',
                        style: TextStyle(
                            color: Color.fromARGB(200, 0, 7, 55), fontSize: 15),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 2, 103),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
