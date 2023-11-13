import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUserInfo extends ChangeNotifier {

    //Docs Ids
  List<String> docsIds = [];

  // Puxa o documento do usuário atual apenas
  Future<DocumentSnapshot?> getCurrentUserDocument() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      DocumentSnapshot userDocument = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return userDocument;
    } else {
      return null;
    }
  }

   //get DocsIds
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            //print(document.reference);
            docsIds.add(document.reference.id);
          }),
        );
  }

  Future<String> getCurrentUserId() async {
    await getDocId(); // Aguarde o preenchimento da lista docsIds

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      for (var i = 0; i < docsIds.length; i++) {
        if (docsIds[i] == user.uid) {
          return docsIds[i];
        }
      }
    }
    return 'Nenhum usuário encontrado';
  }

}
