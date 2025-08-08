import 'package:flutter/material.dart';

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
            color: Colors.grey,
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
