import 'package:flutter/material.dart';
import 'package:project_team3_gps_based_chat_app/common/color.dart';
import 'package:project_team3_gps_based_chat_app/common/repository/vworld_repository.dart';
import 'package:project_team3_gps_based_chat_app/pages/welcome/geolocator_helper.dart';

String? address;

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final VworldRepository vworld = VworldRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 34),
                Row(
                  children: const [
                    Text(
                      'SparkTalk',
                      style: TextStyle(fontSize: 32, letterSpacing: 2),
                    ),
                    SizedBox(width: 6),
                    Text('⚡', style: TextStyle(fontSize: 24)),
                  ],
                ),
                const SizedBox(height: 150),

                // 프로필
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColor.myProfilColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.20),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person_outline,
                      size: 72,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                // 이름 입력창
                TextFormField(
                  controller: controller,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: '사용할 이름을 입력해 주세요',
                    hintStyle: TextStyle(color: AppColor.hintTextColor),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.yellowBoxColor,
                        width: 2,
                      ),
                    ),
                  ),
                  // 이름 검증
                  validator: (value) {
                    final input = value?.trim() ?? '';

                    if (input.isEmpty) {
                      return '이름을 입력해 주세요.';
                    }
                    if (input.length < 2) {
                      return '이름은 두 글자 이상이어야 합니다.';
                    }
                    final validPattern = RegExp(r'^[가-힣a-zA-Z0-9]+$');
                    if (!validPattern.hasMatch(input)) {
                      return '특수문자는 사용할 수 없습니다.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // start 버튼
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      backgroundColor: AppColor.yellowBoxColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black.withOpacity(0.50),
                    ),
                    onPressed: () async {
                      // 버튼 누를 때 검증 실행
                      if (_formKey.currentState!.validate()) {
                        final position = await GeolocatorHelper.getPosition();
                        if (position != null) {
                          final locals = await vworld.findByLatLng(
                            position.latitude,
                            position.longitude,
                          );
                          address = locals[0];
                        }
                        // TODO: 다음 페이지 이동
                      }
                    },
                    child: const Text(
                      '⚡ start ⚡',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
