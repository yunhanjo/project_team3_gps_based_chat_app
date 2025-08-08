import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_content.dart';
import 'package:project_team3_gps_based_chat_app/common/repository/chat_content_repo.dart';

class ChatState {
  final List<ChatContent> contents;
  ChatState(this.contents);
}

class ChatViewModel extends FamilyNotifier<ChatState, String> {
  @override
  ChatState build(chatRoomID) {
    // 초기 상태 빈 리스트
    state = ChatState([]);
    streamMessage(chatRoomID);
    return state;
  }

  final chatContentRepo = ChatContentRepo();

  // 내가 보낸 메세지 서버에 저장
  Future<void> sendMessage({
    required String chatID,
    required String chatNM,
    required String sender,
    required String address,
    required String message,
  }) async {
    final myMessage = await chatContentRepo.createContent(
      chatID: chatID,
      chatNM: chatNM,
      sender: sender,
      address: address,
      message: message,
    );
  }

  // 실시간으로 메세지 불러오기
  void streamMessage(String chatID) {
    final stream = chatContentRepo.streamChatContents(chatID);
    stream.listen((contents) {
      state = ChatState(contents);
    });
  }
}

final chatViewModelProvider =
    NotifierProvider.family<ChatViewModel, ChatState, String>(
      () {
        return ChatViewModel();
      },
    );
