import 'package:flutter_test/flutter_test.dart';
import 'package:project_team3_gps_based_chat_app/common/repository/vworld_repository.dart';

void main() {
  VworldRepository vworldRepository = VworldRepository();

  test('findbyfullnm', () async {
    final result = await vworldRepository.findByLatLng(35.156827, 129.0564967);
    print(result);
  });
}
