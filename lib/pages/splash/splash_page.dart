import 'package:flutter/material.dart';
import 'package:project_team3_gps_based_chat_app/common/repository/user_repo.dart';
import 'package:project_team3_gps_based_chat_app/pages/chatList/chat_list_page.dart';
import 'package:project_team3_gps_based_chat_app/pages/welcome/uuid_create.dart';
import 'package:project_team3_gps_based_chat_app/pages/welcome/welcome_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

UserRepo userRepo = UserRepo();

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () async {
      final id = await LocalIdService.getOrCreateLocalUuid();

      final user = await userRepo.readUser(userID: id);
      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage(id: id)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatListPage(data: {});
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('assets/icons/logo.png')));
  }
}
