import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CacheManager {
  final FlutterSecureStorage _secureStorage;

  CacheManager()
      : _secureStorage = const FlutterSecureStorage(
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
          iOptions:
              IOSOptions(accessibility: KeychainAccessibility.first_unlock),
        );

  Future<void> setString(String key, String value) async =>
      await _secureStorage.write(key: key, value: value);

  Future<void> setBool(String key, bool value) async =>
      await _secureStorage.write(key: key, value: value.toString());

  Future<void> setInt(String key, String value) async =>
      await _secureStorage.write(key: key, value: value);

  Future<void> setDouble(String key, String value) async =>
      await _secureStorage.write(key: key, value: value);

  Future<String?> getString(String key) async =>
      await _secureStorage.read(key: key);

  Future<bool?> getBool(String key) async {
    final string = await _secureStorage.read(key: key);
    if (string == null) return null;
    if (string == 'true') return true;
    if (string == 'false') return false;
    return null;
  }

  Future<int?> getInt(String key) async {
    final string = await _secureStorage.read(key: key);
    if (string == null) return null;
    return int.tryParse(string);
  }

  Future<double?> getDouble(String key) async {
    final string = await _secureStorage.read(key: key);
    if (string == null) return null;
    return double.tryParse(string);
  }

  Future<void> remove(String key) async =>
      await _secureStorage.delete(key: key);

  Future<bool> containsKey(String key) async =>
      await _secureStorage.containsKey(key: key);

  Future<void> clearAll() async => await _secureStorage.deleteAll();
}
