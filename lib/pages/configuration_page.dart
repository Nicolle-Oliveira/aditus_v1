// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_service.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

    void signOut() {
    //chamar o auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                actions: [
            IconButton(
              onPressed: signOut,
              icon: Icon(Icons.logout),
            ),
          ],
      ),
      body: Center(child: Text('Config Page')),
    );
  }
}
