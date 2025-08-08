import 'package:flutter/material.dart';
import 'package:project_team3_gps_based_chat_app/common/repository/vworld_repository.dart';
import 'package:project_team3_gps_based_chat_app/pages/welcome/geolocator_helper.dart';

class WelcomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  VworldRepository vworld = VworldRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JJiRit')),
      body: Column(
        children: [
          Icon(Icons.person),
          TextField(controller: controller, maxLines: 1),
          GestureDetector(
            onTap: () async {
              final position = await GeolocatorHelper.getPosition();
              if (position != null) {
                print(' dkkkkkkkkkk');
              }
            },
            child: Text('위치정보 가져오기'),
          ),
          ElevatedButton(
            onPressed: () {
              vworld.findByLatLng(35, 129);
            },
            child: Text('start'),
          ),
        ],
      ),
    );
  }
}
