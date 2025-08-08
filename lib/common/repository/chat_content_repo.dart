import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_content.dart';

class ChatContentRepo {
  late final _firebase = FirebaseFirestore.instance;
  late final _conllectionRef = _firebase.collection(
    'ChatContent',
  );

  // 채팅내역 데이터 저장하기
  Future<bool> createContent({
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
        'createdAt': DateTime.now(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 선택된 채팅방에 대한 채팅내역 불러오기
  Stream<List<ChatContent>> streamChatContents(String chatID) {
    try {
      final docRef = _conllectionRef
          .where('chatID', isEqualTo: chatID)
          .snapshots();
      final result = docRef.map((event) {
        final list = event.docs.map((doc) {
          return ChatContent.fromJson(doc.data());
        }).toList();
        list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        return list;
      });
      return result;
    } catch (e) {
      print(e);
      return Stream.empty();
    }
  }
}
