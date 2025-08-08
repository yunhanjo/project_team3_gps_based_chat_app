import 'package:dio/dio.dart';

class VworldRepository {
  final Dio client = Dio(BaseOptions(validateStatus: (status) => true));
  // 위도경도로 검색하는 기능
  Future<List<String>> findByLatLng(double lat, double lng) async {
    try {
      final response = await client.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': '7C8F1A44-7DA1-3B31-A17D-7BC5035B67AE',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT($lng $lat)',
          'geometry': false,
          'size': 100,
        },
      );

      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final features = response
            .data['response']['result']['featureCollection']['features'];
        final featuresList = List.from(features);
        final iterable = featuresList.map(
          (e) => '${e['properties']['emd_kor_nm']}',
        );
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
