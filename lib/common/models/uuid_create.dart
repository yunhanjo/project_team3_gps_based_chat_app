import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LocalIdService {
  static const _kKey = 'local_uuid';

  static Future<String> getOrCreateLocalUuid() async {
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString(_kKey);
    if (id == null) {
      id = const Uuid().v4(); // 새 UUID
      await prefs.setString(_kKey, id);
    }
    return id;
  }
}
