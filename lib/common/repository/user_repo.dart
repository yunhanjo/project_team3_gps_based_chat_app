import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_team3_gps_based_chat_app/common/models/user.dart';

class UserRepo {
  Future<User> getUser() async {
    final firebase = FirebaseFirestore.instance;
    final conllectionRef = firebase.collection('User');
    final result = await conllectionRef.get();
    final docs = result.docs;
    return docs.map((doc) {
      final map = doc.data();
      doc.id;
      final newMap = 
    },)
  }
}
