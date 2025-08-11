//
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const ChatListPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('모임 목록')),
      body: Column(
        children: [
          Text('모임 이름: ${data['chatNM']}'),
          Text('설명: ${data['descript']}'),
          Text('카테고리: ${data['category']}'),
          Text('주소: ${data['address']}'),
        ],
      ),
    );
  }
}
