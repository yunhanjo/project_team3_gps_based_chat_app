import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_team3_gps_based_chat_app/common/models/user.dart';
import 'package:project_team3_gps_based_chat_app/common/repository/user_repo.dart';

// 1. 상태만들기
class UserState {
  User? users;
  UserState(this.users);
}

// 2. 뷰 모델 만들기
class UserViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    return UserState(null);
  }

  void insertUser({
    required String userID,
    required String address,
    required String userNM,
    required String mapX,
    required String mapY,
  }) {
    final userRepo = UserRepo();
    userRepo.createUser(
      userID: userID,
      address: address,
      userNM: userNM,
      mapX: mapX,
      mapY: mapY,
    );
  }
}

// 3. 뷰모델 관리자 만들기
final userViewModelProvider = NotifierProvider<UserViewModel, UserState>(() {
  return UserViewModel();
});
