import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class _Item {
  _Item(this.key, this.value);

  final String key;
  final String value;
}

class SecureStorage {
  SecureStorage._();

  static final SecureStorage instance = SecureStorage._();

  final _accountNameController =
      TextEditingController(text: 'flutter_secure_storage_service');

  late final FlutterSecureStorage storage;
  // ignore: library_private_types_in_public_api
  List<_Item> items = [];

  Future<String> read(String key) async {
    return items.where((element) => element.key == key).elementAt(0).value;
  }

  Future<void> readAll() async {
    final all = await storage.readAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    items = all.entries
        .map((entry) => _Item(entry.key, entry.value))
        .toList(growable: false);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    readAll();
  }

  Future<void> addNewItem(String key, String value) async {
    await storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    readAll();
  }

  Future<void> init() async {
    storage = const FlutterSecureStorage();
    _accountNameController.addListener(() => readAll());
    readAll();
  }

  IOSOptions _getIOSOptions() => IOSOptions(accountName: _getAccountName());

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  String? _getAccountName() =>
      _accountNameController.text.isEmpty ? null : _accountNameController.text;
}
