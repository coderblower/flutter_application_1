// filepath: /d:/development/hss/flutter_application_1/lib/services/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../models/user.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> writeUserData(User user) async {
    String userJson = jsonEncode(user.toJson());
    await _storage.write(key: user.email, value: userJson);
  }

  Future<User?> readUserData(String email) async {
    String? userJson = await _storage.read(key: email);
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return User.fromJson(userMap);
    }
    return null;
  }

  Future<void> deleteUserData(String email) async {
    await _storage.delete(key: email);
  }
}