import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_room_info.dart';
import 'package:project_team3_gps_based_chat_app/firebase_options.dart';
import 'package:project_team3_gps_based_chat_app/pages/chat/chat_page.dart';

// String chatID;
// String chatNM;
// String sender;
// String address;
// String message;
// DateTime createdAt;

ChatRoomInfo aa = ChatRoomInfo(
  chatID: 'aa1234',
  name: '조민우',
  address: '상암동',
  chatNM: '초보 등산',
  category: '운동',
  descript: '등산할 사람~',
  hostkey: 'aaa',
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(
        chatID: aa.chatID,
        name: aa.name,
        chatNM: aa.chatNM,
        address: aa.address,
      ),
      theme: ThemeData(textTheme: GoogleFonts.playpenSansTextTheme()),
    );
  }
}
