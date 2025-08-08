import 'package:flutter/material.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';

class bottomWriteBox extends StatelessWidget {
  TextEditingController textEditingController;
  bottomWriteBox({
    required this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        color: AppColor.yellowBoxColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(minHeight: 45),
                  child: TextField(
                    textAlignVertical: TextAlignVertical(
                      y: 0.01,
                    ),
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 8,
                        bottom: 0,
                        left: 12,
                        right: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    controller: textEditingController,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 45,
                height: 45,
                alignment: Alignment(0.1, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
                child: Image.asset(
                  'assets/icons/send.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
