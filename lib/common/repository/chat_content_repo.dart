import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_content.dart';

class ChatContentRepo {
  late final _firebase = FirebaseFirestore.instance;
  late final _conllectionRef = _firebase.collection(
    'ChatContent',
  );

  // 채팅내역 데이터 저장하기
  Future<bool> createUser({
    required String chatID,
    required String chatNM,
    required String sender,
    required String address,
    required String message,
  }) async {
    try {
      final docRef = _conllectionRef.doc();
      await docRef.set({
        'chatID': chatID,
        'chatNM': chatNM,
        'sender': sender,
        'address': address,
        'message': message,
        'createAt': DateTime.now(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 선택된 채팅방에 대한 채팅내역 불러오기
  Future<List<ChatContent>> readChatContents(
    String chatRoomID,
  ) async {
    try {
      final docRef = await _conllectionRef
          .where('chatID', isEqualTo: chatRoomID)
          .get();
      final result = docRef.docs.map((doc) {
        return ChatContent.fromJson(doc.data());
      }).toList();
      result.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      return result;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
