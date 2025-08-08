import 'package:flutter/material.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';

class otherContent extends StatelessWidget {
  const otherContent({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text('김현수'),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200),
                child: Container(
                  padding: EdgeInsets.all(6),
                  constraints: BoxConstraints(minHeight: 35),
                  decoration: BoxDecoration(
                    color: AppColor.greyBoxColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text('안녕하세요!', softWrap: true),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 5),
        Text('11:12'),
        Spacer(),
      ],
    );
  }
}
