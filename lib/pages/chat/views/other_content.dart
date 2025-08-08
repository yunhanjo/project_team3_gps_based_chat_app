import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_content.dart';

class otherContent extends StatelessWidget {
  ChatContent content;
  otherContent({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    String time = DateFormat('HH:mm').format(content.createdAt);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // 프로필
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.greyBoxColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/icons/profile.png'),
        ),
        SizedBox(width: 12),

        // 이름 + 말풍선
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content.sender),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8,
                  ),
                  constraints: BoxConstraints(minHeight: 35),
                  decoration: BoxDecoration(
                    color: AppColor.greyBoxColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(content.message, softWrap: true),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 5),
        Text(
          time,
          style: TextStyle(
            fontSize: 12,
            color: AppColor.greyTextColor,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
