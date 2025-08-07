import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_room_info.dart';

class ChatRoomInfoRepo {
  late final _firebase = FirebaseFirestore.instance;
  late final _conllectionRef = _firebase.collection(
    'ChatRoomInfo',
  );

  // 채팅방정보 데이터 저장하기
  Future<bool> createChatRoom({
    required String chatID,
    required String name,
    required String address,
    required String chatNM,
    required String category,
    required String descript,
    required String hostkey,
  }) async {
    try {
      final docRef = _conllectionRef.doc();
      await docRef.set({
        'chatID': chatID,
        'name': name,
        'address': address,
        'chatNM': chatNM,
        'category': category,
        'descript': descript,
        'hostkey': hostkey,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 현재 지역과 같은 지역인 채팅방 데이터 불러오기
  Future<List<ChatRoomInfo>>? getchatrooms(
    String address,
  ) async {
    try {
      final docRef = await _conllectionRef
          .where('address', isEqualTo: address)
          .get();
      if (docRef.docs.isNotEmpty) {
        final result = docRef.docs.map((doc) {
          return ChatRoomInfo.fromJson(doc.data(), doc.id);
        });
        return result.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
