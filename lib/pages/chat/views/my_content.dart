import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_content.dart';

class myContent extends StatelessWidget {
  ChatContent content;
  myContent({required this.content});

  @override
  Widget build(BuildContext context) {
    String time = DateFormat('HH:mm').format(content.createdAt);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        Text(
          time,
          style: TextStyle(
            color: AppColor.greyTextColor,
            fontSize: 12,
          ),
        ),
        SizedBox(width: 5),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 8,
          ),
          constraints: BoxConstraints(
            minHeight: 35,
            maxWidth: 200,
          ),
          decoration: BoxDecoration(
            color: AppColor.myContentBoxColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Text(content.message),
        ),
      ],
    );
  }
}
