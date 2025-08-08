import 'package:flutter/material.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';

class myContent extends StatelessWidget {
  const myContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('11:30'),
        SizedBox(width: 5),
        Container(
          padding: EdgeInsets.all(6),
          height: 35,
          decoration: BoxDecoration(
            color: AppColor.myContentBoxColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Center(child: Text('안녕하세요!')),
        ),
      ],
    );
  }
}
