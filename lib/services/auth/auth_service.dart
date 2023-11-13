import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  //instância de autenticação
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instancia do firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //login
  Future<UserCredential> signInWithEmailandPassword(
      String email, password) async {
    try {
      //login
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      

      return userCredential;
    }

    //caso tenha erros
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //cadastro
  Future<UserCredential> signUpWithEmailandPassword(
      String email, password, nome, sobrenome, isVoluntario) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //depois de criar o usuario, crie um novo documento para ele na colleção users
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'email' : email,
        'nome' : nome,
        'sobrenome' : sobrenome,
        'isVoluntario' : isVoluntario,

      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  //logout
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
