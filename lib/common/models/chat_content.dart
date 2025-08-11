import 'package:cloud_firestore/cloud_firestore.dart';

class ChatContent {
  String chatID;
  String chatNM;
  String sender;
  String address;
  String message;
  DateTime createdAt;
  ChatContent({
    required this.chatID,
    required this.chatNM,
    required this.sender,
    required this.address,
    required this.message,
    required this.createdAt,
  });

  ChatContent.fromJson(Map<String, dynamic> map)
    : this(
        chatID: map['chatID'],
        chatNM: map['chatNM'],
        sender: map['sender'],
        address: map['address'],
        message: map['message'],
        createdAt: (map['createdAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() {
    return {
      'chatID': chatID,
      'chatNM': chatNM,
      'sender': sender,
      'address': address,
      'message': message,
      'createdAt': createdAt,
    };
  }
}
