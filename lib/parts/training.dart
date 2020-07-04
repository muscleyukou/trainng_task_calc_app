
import 'package:cloud_firestore/cloud_firestore.dart';

class Training{
  Training(DocumentSnapshot doc){
    documentId=doc.documentID;
    menu=doc['menu'];
  }
  String documentId;
  String  menu;
}