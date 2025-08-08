import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JJiRit')),
      body: Column(
        children: [
          Icon(Icons.person),
          TextField(controller: controller,
          maxLines: 1,
          ),
          Text('위치정보 가져오기'),
          ElevatedButton(onPressed: () {}, child: Text('start')),
        ],
      ),
    );
  }
}
