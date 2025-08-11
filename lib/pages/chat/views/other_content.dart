import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/common/models/chat_content.dart';

/// 다른 사용자 채팅 박스
class otherContent extends StatelessWidget {
  ChatContent content;
  ChatContent? prevContent;
  otherContent({
    required this.content,
    required this.prevContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String time = DateFormat('HH:mm').format(content.createdAt);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 프로필
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: content.sender != prevContent?.sender
              ? profil()
              : SizedBox(width: 50),
        ),
        SizedBox(width: 12),

        // 이름 + 말풍선 + 시간
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이름
              content.sender != prevContent?.sender
                  ? Text(content.sender)
                  : SizedBox.shrink(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // 말풍선
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        constraints: BoxConstraints(
                          minHeight: 35,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.greyBoxColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          content.message,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  // 시간
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.greyTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 프로필
class profil extends StatelessWidget {
  const profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.greyBoxColor,
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/icons/profile.png'),
    );
  }
}
