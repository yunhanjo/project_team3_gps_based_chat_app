import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/chat_page.dart';
import 'package:project_team3_gps_based_chat_app/pages/chatAdd/chat_add_page.dart';
import '/common/models/chat_room_info.dart';
import '/pages/chatList/viewmodel/chat_list_view_model.dart';
import '/common/color.dart';

class ChatListPage extends StatefulWidget {
  final String address;
  final String name;
  final String userID;

  const ChatListPage({
    super.key,
    required this.address,
    required this.name,
    required this.userID,
  });

  @override
  /// ignore 주석의 역할
  /// ignore: library_private_types_in_public_api 는
  /// "private 타입을 public 메서드에서 반환하는 걸 무시해달라"는 의미입니다.
  /// 즉, 이 경고를 무시하고 싶을 때 쓰는 주석이죠.
  // ignore: library_private_types_in_public_api
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final ChatListViewModel viewModel = ChatListViewModel();

  String filter = 'all'; // 기본 필터: 전체
  String selectedCategory = ''; // 선택된 카테고리
  List<String> category = []; // Firestore에서 불러온 카테고리 목록
  bool isLoadingCategory = false; // 카테고리 로딩 상태
  final bool _showAddIcon = false; // FAB 아이콘 상태

  @override
  void initState() {
    super.initState();
    _loadCategoryFromFirestore(); // 카테고리 목록 불러오기
  }

  /// Firestore에서 카테고리 목록 불러오기
  Future<void> _loadCategoryFromFirestore() async {
    setState(() => isLoadingCategory = true);

    final snapshot = await FirebaseFirestore.instance
        .collection('ChatRoomInfo')
        .get();
    print('불러온 문서 수: ${snapshot.docs.length}');

    final loaded = <String>{}; // Set을 사용하여 중복 제거

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final category = data['category'] as String?;
      if (category != null && category.isNotEmpty) {
        loaded.add(category);
      }
    }

    setState(() {
      category = loaded.toList();
      isLoadingCategory = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.yellowBoxColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomRight: Radius.circular(80),
          ),
        ),
        title: Text('스파크톡'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: _location(),
          ),
          _buildFilterButtons(),
          if (filter == 'category') _buildCategoryDropdown(),
          Expanded(child: _buildChatRoomCards()),
        ],
      ),
      floatingActionButton: _buildSpeechBubbleFAB(),
    );
  }

  // 현재 위치
  Widget _location() {
    return Row(
      mainAxisSize: MainAxisSize.min, // 내용만큼만 공간 차지
      children: [
        Icon(
          Icons.location_on_outlined,
          color: AppColor.blackOutline,
        ),
        SizedBox(width: 4), // 아이콘과 텍스트 사이 간격
        Text(
          '${widget.address} 주변',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  /// 필터 버튼 UI
  Widget _buildFilterButtons() {
    final filters = {
      '전체': 'all',
      '오늘': 'today',
      '내일': 'tomorrow',
      '이번 주': 'week',
      '카테고리': 'category',
    };

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        spacing: 5,
        children: filters.entries.map((entry) {
          final isSelected = filter == entry.value;
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected
                  ? AppColor.myProfilColor
                  : Colors.grey[300],
              foregroundColor: isSelected
                  ? AppColor.blackTextColor
                  : Colors.black,
            ),
            onPressed: () => setState(() {
              filter = entry.value;
              selectedCategory = '';
            }),
            child: Text(entry.key),
          );
        }).toList(),
      ),
    );
  }

  /// 카테고리 선택 드롭다운 UI
  Widget _buildCategoryDropdown() {
    if (isLoadingCategory) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<String>(
        value: selectedCategory.isEmpty
            ? null
            : selectedCategory,
        hint: Text('카테고리를 선택하세요'),
        isExpanded: true,
        items: category.map((cat) {
          return DropdownMenuItem(value: cat, child: Text(cat));
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCategory = value ?? '';
          });
        },
      ),
    );
  }

  /// 채팅방 카드 목록 UI
  Widget _buildChatRoomCards() {
    return StreamBuilder<List<ChatRoomInfo>>(
      stream: viewModel.getChatRooms(
        address: widget.address,
        filter: filter,
        category: selectedCategory,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('주변에 Spark 모임이 없습니다. \n 새 모임을 열어 주세요'),
          );
        }

        final rooms = snapshot.data!;
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            final room = rooms[index];
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey.shade300,
                ), // 회색 아웃라인
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 왼쪽: 텍스트 정보
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            room.chatNM, //채팅방 명
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            room.descript.length >
                                    20 //상세내용이 길면 20자 까지만 출력하고 '...'으로 줄임
                                ? '${room.descript.substring(0, 20)}...'
                                : room.descript,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            room.category,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    // 오른쪽: 참여하기 버튼
                    ElevatedButton(
                      onPressed: () {
                        print('참여하기 클릭됨');
                        //채팅 참여하기 버튼 이동하는 네비게이터(파라미터 값 추가해서 전달)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              chatNM: room.chatNM,
                              chatID: room.chatID,
                              name: widget.name,
                              address: room.address,
                            ),
                          ),
                        );
                      },
                      child: Text('Spark ⚡'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadiusGeometry.circular(16),
                        ),
                        padding: EdgeInsets.all(12),
                        textStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// 채팅방 추가 버튼 UI - Positioned 제거됨 (1번 방식)
  Widget _buildSpeechBubbleFAB() {
    return FloatingActionButton(
      onPressed: _onAddChatRoom,
      backgroundColor: AppColor.greyTextColor,
      tooltip: '채팅방 만들기',
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 28,
            color: Colors.white,
          ),
          AnimatedOpacity(
            opacity: _showAddIcon ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: AnimatedScale(
              scale: _showAddIcon ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                  right: 4,
                ),
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 채팅방 추가 다이얼로그
  void _onAddChatRoom() {
    print('채팅방 만들기 클릭됨');
    // 채팅방 등록 페이지로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatAddPage(
          address: widget.address,
          name: widget.name,
          chatID: widget.userID,
          hostkey: widget.userID,
        ),
      ),
    );
  }
}
