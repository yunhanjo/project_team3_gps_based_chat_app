import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomInfo {
  final String chatID;
  final String name;
  final String address;
  final String chatNM;
  final String category;
  final String descript;
  final String hostkey;
  final DateTime createdAt;  

  ChatRoomInfo({
    required this.chatID,
    required this.name,
    required this.address,
    required this.chatNM,
    required this.category,
    required this.descript,
    required this.hostkey,
    required this.createdAt
  });

  ChatRoomInfo.fromJson(Map<String, dynamic> map, String id)
    : this(
        chatID: id,
        name: map['name'] as String? ?? '',
        address: map['address'] as String? ?? '',
        chatNM: map['chatNM'] as String? ?? '',
        category: map['category'] as String? ?? '',
        descript: map['descript'] as String? ?? '',
        hostkey: map['hostkey'] as String? ?? '',
        createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime(2000)
      );


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'chatNM': chatNM,
      'category': category,
      'descript': descript,
      'hostkey': hostkey,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
