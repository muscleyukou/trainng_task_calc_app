
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInModel extends ChangeNotifier{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn=GoogleSignIn();
  final String title ='Sign In';
  String mail='';
  String pass='';

  Future signIn()async{
    if(mail.isEmpty){
      throw ('メールアドレスを入力してください');
    }
    if(pass.isEmpty){
      throw ('パスワードを入力してください');
    }
    final FirebaseUser user = (await auth.createUserWithEmailAndPassword(
      email: mail,
      password:pass,
    ))
        .user;
    Firestore.instance.collection('users').add({
      'mail':mail,
      'createdAt':Timestamp.now(),
    });
  }

}