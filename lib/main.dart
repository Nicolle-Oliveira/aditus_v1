// ignore_for_file: prefer_const_constructors

import 'package:aditus_v1/firebase_options.dart';
import 'package:aditus_v1/services/auth/auth_service.dart';
import 'package:aditus_v1/services/user_info_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth/auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => CurrentUserInfo()),
      ],
      child: const MyApp(),
    )
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGage(), //AuthGage(),
    );
  }
}
