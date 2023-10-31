// ignore_for_file: prefer_const_constructors

import 'package:aditus_v1/components/navbar_roots_s.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_or_register_page.dart';

class AuthGage extends StatelessWidget {
  const AuthGage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          return NavBarRootsS();
        } else {
          return LoginOrRegisterPage();
        }
      },
    ));
  }
}
