import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_team3_gps_based_chat_app/pages/chatAdd/viewmodel/chat_add_view_model.dart';

class ChatAddPage extends StatefulWidget {
  String address;
  String chatID;
  String name;
  ChatAddPage({
    required this.address,
    required this.chatID,
    required this.name,
  });
  @override
  _ChatAddPageState createState() => _ChatAddPageState();
}

class _ChatAddPageState extends State<ChatAddPage> {
  late ChatAddViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ChatAddViewModel();
  }

  @override
  void dispose() {
    viewModel.disposeControllers();
    super.dispose();
  }

  void _goToListPage() async {
    if (viewModel.chatNMController.text.isEmpty ||
        viewModel.descriptController.text.isEmpty ||
        viewModel.selectedCategory == '카테고리 선택') {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('모든 항목을 입력해주세요.')));
      return;
    }

    try {
      await viewModel.saveChatData(widget.address); // 저장
      final data = viewModel.getChatData(widget.address);
      Navigator.pop(context, data);
      // 저장 후 pop으로 데이터 전달
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('저장 중 오류가 발생했습니다. 다시 시도해주세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('스파크 만들기'),
        backgroundColor: Color(0xFFFFEB86),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    width: 300,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFED92), // 테두리 색상
                        width: 3, // 테두리 두께
                      ),
                      borderRadius: BorderRadius.circular(50),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black.withAlpha(15), // 약한 회색
                      //     offset: Offset(0, 5), // 아래 방향 그림자
                      //     blurRadius: 3, // 부드러움
                      //     spreadRadius: 0, // 퍼짐 없음
                      //   ),
                      // ],
                    ),
                    child: Text.rich(
                      //부분 텍스트 스타일 적용
                      TextSpan(
                        text: '현재 ${widget.name}님의 위치\n',
                        style: TextStyle(fontSize: 16), // 기본 스타일
                        children: [
                          TextSpan(
                            text: '⚡${widget.address}⚡',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                DropdownButton<String>(
                  value: viewModel.selectedCategory,
                  items: viewModel.categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        viewModel.updateCategory(value);
                      });
                    }
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  child: TextField(
                    controller: viewModel.chatNMController,
                    decoration: InputDecoration(
                      labelText: '스파크 이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  child: TextField(
                    controller: viewModel.descriptController,
                    decoration: InputDecoration(
                      labelText: '스파크 소개',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _goToListPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(
                        0xFFFFEB86,
                      ), // 버튼 배경색
                      foregroundColor: Colors.black, // 텍스트 색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // 모서리 둥글게
                      ),
                      elevation: 3, // 그림자 깊이
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '⚡',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: ' Spark',
                            style: GoogleFonts.playpenSans(
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: '!',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    //⚡
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
