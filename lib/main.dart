import 'package:flutter/material.dart';
import 'package:project_team3_gps_based_chat_app/pages/welcome/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelcomePage());
  }
}
