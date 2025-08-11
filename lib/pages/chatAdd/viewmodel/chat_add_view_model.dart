import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatAddViewModel extends ChangeNotifier {
  String selectedCategory = '카테고리 선택';
  final List<String> categories = [
    '카테고리 선택',
    '🏃🏻‍♀️ 운동',
    '🎨 문화·예술',
    '📚 자기계발',
    '🍳 생활·취미',
    '👨‍👩‍👧‍👦 가족·육아',
    '💬 소통',
    '🌱 봉사·지역활동',
  ];

  final TextEditingController chatNMController = TextEditingController();
  final TextEditingController descriptController = TextEditingController();

  void updateCategory(String newCategory) {
    selectedCategory = newCategory;
    notifyListeners();
  }

  void disposeControllers() {
    chatNMController.dispose();
    descriptController.dispose();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveChatData(String address) async {
    final chatData = getChatData(address);

    try {
      await _firestore.collection('ChatRoomInfo').add(chatData);
      print('✅ Firestore 저장 성공!');
    } catch (e) {
      print('❌ Firestore 저장 실패: $e');
      rethrow;
    }
  }

  Map<String, dynamic> getChatData(String address) {
    return {
      'chatNM': chatNMController.text,
      'descript': descriptController.text,
      'category': selectedCategory,
      'address': address,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
