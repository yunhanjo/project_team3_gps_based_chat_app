import 'package:flutter/material.dart';

class bottomWriteBox extends StatelessWidget {
  const bottomWriteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(child: TextField()),
            SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Center(
                child: Image.asset('assets/icons/send.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
