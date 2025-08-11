import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LocalIdService {
  static const _kKey = 'local_uuid';

  static Future<String> getOrCreateLocalUuid() async {
    print(1);
    final prefs = await SharedPreferences.getInstance();
    print(2);
    var id = prefs.getString(_kKey);
    print("$id");
    if (id == null) {
      id = const Uuid().v4(); // 새 UUID
      await prefs.setString(_kKey, id);
    }
    return id;
  }
}
