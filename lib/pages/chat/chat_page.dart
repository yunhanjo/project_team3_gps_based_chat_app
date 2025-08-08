import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/bottom_write_box.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/my_content.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/views/other_content.dart';

class ChatPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  TextEditingController textEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.yellowBoxColor,
        title: Text('맛집탐방 모임'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [otherContent(), myContent()],
                  ),
                );
              },
            ),
          ),
          bottomWriteBox(
            textEditingController: textEditingController,
          ),
        ],
      ),
    );
  }
}
