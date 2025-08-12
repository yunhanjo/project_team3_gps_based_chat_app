import 'package:cloud_firestore/cloud_firestore.dart';
import '/common/models/chat_room_info.dart';

class ChatListViewModel {
  /// 주소, 필터, 카테고리에 따라 채팅방 목록을 스트림으로 반환
  Stream<List<ChatRoomInfo>> getChatRooms({
    required String address,
    required String filter,
    String? category,
  }) {
    Query query = FirebaseFirestore.instance.collection('ChatRoomInfo');

    // 주소 필터
    query = query.where('address', isEqualTo: address);

    final now = DateTime.now();
    DateTime start, end;

    // 필터별 createdAt 조건 설정
    switch (filter) {
      case 'today':
        start = DateTime(now.year, now.month, now.day);
        end = start.add(Duration(days: 1));
        query = query
            .where(
              'createdAt',
              isGreaterThanOrEqualTo: Timestamp.fromDate(start),
            )
            .where('createdAt', isLessThan: Timestamp.fromDate(end));
        break;

      case 'yesterday':
        start = DateTime(now.year, now.month, now.day).add(Duration(days: -1));
        end = start.add(Duration(days: 1));
        query = query
            .where(
              'createdAt',
              isGreaterThanOrEqualTo: Timestamp.fromDate(start),
            )
            .where('createdAt', isLessThan: Timestamp.fromDate(end));
        break;

      case 'week':
        final weekday = now.weekday;
        start = DateTime(
          now.year,
          now.month,
          now.day,
        ).subtract(Duration(days: weekday - 1));
        end = start.add(Duration(days: 7));
        query = query
            .where(
              'createdAt',
              isGreaterThanOrEqualTo: Timestamp.fromDate(start),
            )
            .where('createdAt', isLessThan: Timestamp.fromDate(end));
        break;

      case 'category':
        if (category != null && category.isNotEmpty) {
          query = query.where('category', isEqualTo: category);
        }
        break;

      case 'all':
      default:
        // 전체: createdAt 필터 없음
        break;
    }

    // 정렬: createdAt 기준 (createdAt을 사용하는 where가 있다면 인덱스 필요)
    query = query.orderBy('createdAt', descending: true);

    // 결과를 ChatRoomInfo 리스트로 변환
    return query.snapshots().map((snapshot) {
      //print('문서 ~수: ${snapshot.docs.length}');
      for (var doc in snapshot.docs) {
        //print('문서ID: ${doc.id}, 데이터: ${doc.data()}');
      }
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        // createdAt이 null인 경우 방어 처리
        if (!data.containsKey('createdAt') || data['createdAt'] == null) {
          data['createdAt'] = Timestamp.fromDate(DateTime(2000)); // 기본값
        }
        return ChatRoomInfo.fromJson(data, doc.id);
      }).toList();
    });
  }
}
