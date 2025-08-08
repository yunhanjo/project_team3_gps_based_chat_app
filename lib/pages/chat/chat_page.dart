import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/viewmodel/chat_view_model.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/bottom_write_box.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/my_content.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/other_content.dart';

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
    final chatState = ref.watch(
      chatViewModelProvider(widget.chatID),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.yellowBoxColor,
        title: Text(widget.chatNM),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: chatState.contents.length,
                itemBuilder: (context, index) {
                  final content = chatState.contents[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        widget.name != content.sender
                            ? otherContent(content: content)
                            : myContent(content: content),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          bottomWriteBox(
            textEditingController: textEditingController,
            sendMessage: writeMessage,
          ),
        ],
      ),
    );
  }
}
