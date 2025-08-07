import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_team3_gps_based_chat_app/common/models/user.dart';

class UserRepo {
  late final _firebase = FirebaseFirestore.instance;
  late final _conllectionRef = _firebase.collection('User');
  Future<List<User>> getUser() async {
    try {
      final result = await _conllectionRef.get();
      final docs = result.docs;
      return docs.map((doc) {
        return User.fromJson(doc.data());
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  // User 데이터 서버에 저장하기
  Future<bool> createUser({
    required String userID,
    required String address,
    required String userNM,
    required String mapX,
    required String mapY,
  }) async {
    try {
      final docRef = _conllectionRef.doc();
      await docRef.set({
        'userID': userID,
        'address': address,
        'userNM': userNM,
        'mapX': mapX,
        'mapY': mapY,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 디바이스 키랑 사용자 ID가 같은 데이터 불러오기
  Future<User?> readUser({required String userID}) async {
    try {
      final docRef = await _conllectionRef
          .where('userID', isEqualTo: userID)
          .get();
      if (docRef.docs.isNotEmpty) {
        final user = docRef.docs.first;
        return User.fromJson(user.data());
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
