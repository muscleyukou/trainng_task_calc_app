import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInModel extends ChangeNotifier{
final String title ='Log In';
final FirebaseAuth auth=FirebaseAuth.instance;
final GoogleSignIn googleSignIn=GoogleSignIn();
String mail='';
String pass='';

Future logIn()async{
  if(mail.isEmpty){
    throw ('メールを入力してください');
  }
  if(pass.isEmpty){
    throw ('パスワードを入力してください');
  }
  final result =await auth.signInWithEmailAndPassword(
    email: mail,
    password:pass,
  );
  final uid=result.user.uid;
  //todo 端末に保存
}
Future signInGoogle()async{
  final GoogleSignInAccount googleUser=await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth=await googleUser.authentication;
  final AuthCredential credential=GoogleAuthProvider.getCredential(
    idToken:googleAuth.idToken,
    accessToken:googleAuth.idToken,);
}
}