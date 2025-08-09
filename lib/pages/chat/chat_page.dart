import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_content.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/viewmodel/chat_view_model.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/bottom_write_box.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/my_content.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/other_content.dart';

/// 채팅 페이지
class ChatPage extends ConsumerStatefulWidget {
  String chatNM;
  String chatID;
  String name;
  String address;
  ChatPage({
    required this.chatID,
    required this.name,
    required this.chatNM,
    required this.address,
  });
  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  TextEditingController textEditingController =
      TextEditingController();
  ScrollController scrollController = ScrollController();

  // 채팅 입력 시 서버에 저장
  void writeMessage(String message) {
    ref
        .read(chatViewModelProvider(widget.chatID).notifier)
        .sendMessage(
          chatID: widget.chatID,
          chatNM: widget.chatNM,
          sender: widget.name,
          address: widget.address,
          message: message,
        );
  }

  @override
  Widget build(BuildContext context) {
    // 채팅 내역 실시간 구독
    final chatState = ref.watch(
      chatViewModelProvider(widget.chatID),
    );
    // 채팅 입력 시 아래로 스크롤
    ref.listen<ChatState>(chatViewModelProvider(widget.chatID), (
      prev,
      next,
    ) {
      if (next.contents.length != prev?.contents.length) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      // 앱바 : 채팅방 이름
      appBar: AppBar(
        backgroundColor: AppColor.yellowBoxColor,
        title: Text(widget.chatNM),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              // 채팅 내역
              child: ListView.builder(
                controller: scrollController,
                itemCount: chatState.contents.length,
                itemBuilder: (context, index) {
                  final content = chatState.contents[index];
                  final prevContent = index != 0
                      ? chatState.contents[index - 1]
                      : null;
                  return Column(
                    children: [
                      index == 0
                          ? SizedBox(height: 5)
                          : SizedBox.shrink(),
                      content.sender != prevContent?.sender
                          ? SizedBox(height: 15)
                          : SizedBox(height: 10),
                      widget.name != content.sender
                          ? otherContent(
                              content: content,
                              prevContent: prevContent,
                            )
                          : myContent(content: content),
                    ],
                  );
                },
              ),
            ),
          ),
          // 채팅 입력 박스
          bottomWriteBox(
            textEditingController: textEditingController,
            sendMessage: writeMessage,
          ),
        ],
      ),
    );
  }
}
