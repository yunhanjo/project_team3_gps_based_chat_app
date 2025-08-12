import 'package:geolocator/geolocator.dart';

class GeolocatorHelper {
  static Future<Position?> getPosition() async {
    // 1. 현재 권한이 허용되지 않았을 때 권한 요청하기
    final permission = await Geolocator.checkPermission();

    // 2. 권한 요청 후 결과가 거부일 때 리턴하기
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      final permission2 = await Geolocator.requestPermission();
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        return null;
      }
    }

    // 3. Geolacator로 위치 가져와서 리턴하기
    final currentPosition = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
    print(currentPosition);
    return currentPosition;
  }
}
