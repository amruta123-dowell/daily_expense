import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'constant_keys.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static SecureStorage _secureStorageInstance = SecureStorage();

  factory SecureStorage() {
    if (_secureStorageInstance == null) {
      return _secureStorageInstance = SecureStorage._internal();
    } else {
      return _secureStorageInstance;
    }
  }
  SecureStorage._internal();

  Future<void> setValue({required String key, required String text}) async {
    await _secureStorage.write(key: key, value: text);
  }

  Future<String?> getValue({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> setBoolValue({required String key, required bool value}) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<bool> getBoolValue({required String key}) async {
    if (await _secureStorage.read(key: key) != null &&
        await _secureStorage.read(key: key) == "true") {
      return true;
    } else {
      return false;
    }
  }
}
