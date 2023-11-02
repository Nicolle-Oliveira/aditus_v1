// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  const GetUserName({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return data['isVoluntario']
                ? Text('${data['nome']} - Intérprete',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 10, 77),
                        fontWeight: FontWeight.w500))
                : Text('${data['nome']} - Usuário Surdo',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 10, 77),
                        fontWeight: FontWeight.w500));
          }
          return Text('loading...');
        }));
  }
}
