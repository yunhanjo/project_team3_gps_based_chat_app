import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_team3_gps_based_chat_app/pages/chatAdd/viewmodel/chat_add_view_model.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/common/repository/user_repo.dart';
import 'package:project_team3_gps_based_chat_app/common/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatAddPage extends StatefulWidget {
  String name;
  String address;
  String chatID;
  String hostkey;
  ChatAddPage({
    super.key,
    required this.address,
    required this.name,
    required this.chatID,
    required this.hostkey,
  });
  @override
  _ChatAddPageState createState() => _ChatAddPageState();
}

class _ChatAddPageState extends State<ChatAddPage> {
  late ChatAddViewModel viewModel;
  String userName = "Loading...";
  String userAddress = "Loading...";
  final UserRepo userRepo = UserRepo();
  late DateTime currentDateTime;
  @override
  void initState() {
    super.initState();
    viewModel = ChatAddViewModel();
    currentDateTime = DateTime.now(); // 현재 시간 설정
    _loadUserInfo();
  }

  @override
  void dispose() {
    viewModel.disposeControllers();
    super.dispose();
  }

  void _loadUserInfo() async {
    User? user = await userRepo.readUser(userID: widget.hostkey);
    if (user != null) {
      setState(() {
        userName = user.userNM;
        userAddress = user.address;
      });
    } else {
      setState(() {
        userName = "윤한조";
        userAddress = "강남동";
      });
    }
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
      // Firestore에 데이터 저장
      await _saveChatDataToFirestore();
      // 저장 후 리스트 페이지로 데이터 넘기기
      final data = {
        'address': userAddress,
        'category': viewModel.selectedCategory,
        'name': viewModel.chatNMController.text,
        'description': viewModel.descriptController.text,
        'createdAt': currentDateTime,
        'chatID': widget.chatID,
        'hostkey': widget.hostkey,
      };
      Navigator.pop(context, data); // 리스트 페이지로 데이터 넘기기
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('저장 중 오류가 발생했습니다. 다시 시도해주세요.')));
    }
  }

  Future<void> _saveChatDataToFirestore() async {
    final chatCollectionRef = FirebaseFirestore.instance.collection(
      'ChatRoomInfo',
    );
    // Firestore 문서 ID를 chatID로 설정하기 위해 새로운 문서 추가
    final docRef = chatCollectionRef.doc(); // 새로운 문서 생성 (자동으로 생성된 ID 사용)
    final chatID = docRef.id; // 생성된 문서의 ID를 chatID로 사용
    await docRef.set({
      'chatID': chatID, // chatID는 문서의 ID로 사용
      'address': widget.address, // 예시로 '상암동' 사용 (실제 주소로 변경 가능)
      'category': viewModel.selectedCategory, // 선택된 카테고리
      'chatNM': viewModel.chatNMController.text, // 스파크 이름
      'createdAt': Timestamp.fromDate(currentDateTime), // Timestamp로 변환
      'descript': viewModel.descriptController.text, // 스파크 소개
      'hostkey': widget.hostkey, // 실제 로그인된 사용자 ID로 변경 필요
      'name': userName, // 사용자 이름 (이미 불러온 이름)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.yellowBoxColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomRight: Radius.circular(80),
          ),
        ),
        title: Text('스파크 만들기'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
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
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: '현재 $userName님의 위치\n',
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: '⚡$userAddress⚡',
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
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: TextField(
                    controller: viewModel.chatNMController,
                    decoration: InputDecoration(
                      labelText: '스파크 이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
                      backgroundColor: Color(0xFFFFEB86),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
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
                            style: GoogleFonts.jetBrainsMono(fontSize: 20),
                          ),
                          TextSpan(
                            text: ' Spark',
                            style: GoogleFonts.playpenSans(fontSize: 18),
                          ),
                          TextSpan(
                            text: '!',
                            style: GoogleFonts.jetBrainsMono(fontSize: 20),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
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
