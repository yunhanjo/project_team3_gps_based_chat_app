import 'package:flutter/material.dart';

class otherContent extends StatelessWidget {
  const otherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('김현수'),
            Container(
              padding: EdgeInsets.all(6),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Center(child: Text('안녕하세요!')),
            ),
          ],
        ),
        SizedBox(width: 5),
        Text('11:12'),
      ],
    );
  }
}
