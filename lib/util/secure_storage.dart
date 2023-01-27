import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class _Item {
  _Item(this.key, this.value);

  final String key;
  final String value;
}

// ignore: library_private_types_in_public_api
_SecureStorage secureStorage = _SecureStorage.instance;

class _SecureStorage {
  _SecureStorage._();

  static final _SecureStorage instance = _SecureStorage._();

  final _accountNameController =
      TextEditingController(text: 'flutter_secure_storage_service');

  late final FlutterSecureStorage storage;
  List<_Item> items = [];

  Future<String> get(String key) async {
    _Item item =
        items.where((element) => element.key == key.toLowerCase()).first;
    return item == null ? "" : item.value;
  }

  Future<void> getAll() async {
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
    getAll();
  }

  Future<void> add(String key, String value) async {
    await storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    getAll();
  }

  Future<void> init() async {
    storage = const FlutterSecureStorage();
    _accountNameController.addListener(() => getAll());
    getAll();
  }

  IOSOptions _getIOSOptions() => IOSOptions(accountName: _getAccountName());

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  String? _getAccountName() =>
      _accountNameController.text.isEmpty ? null : _accountNameController.text;
}
