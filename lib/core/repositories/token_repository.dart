import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/services/secure_storage.dart';
import 'package:obd/utils/storage_keys_constants.dart';

final tokenRepositoryProvider = ChangeNotifierProvider(
  (ref) => TokenRepository(ref.read(secureStorageProvider)),
);

class TokenRepository extends ChangeNotifier {
  //* Dependency
  final FlutterSecureStorage secureStorage;

  //* State
  String? _authToken;
  UserInfoModel? _userInfo;

  //* Getters
  String? get authToken => _authToken;
  UserInfoModel? get userInfo => _userInfo;

  //* Constructor
  TokenRepository(this.secureStorage);

  //* Token Methods

  /// Deletes token from local storage.
  Future<void> deleteUserAccess() async {
    await secureStorage.delete(key: kUserInfo);
    _authToken = null;
    _userInfo = null;
  }

  // Saves or Updates token in local storage with the given [newToken].
  Future<void> saveUserAccess(UserInfoModel user) async {
    _authToken = user.loginInfo?.accessToken;
    _userInfo = user;
    //TODO fix bug

    await secureStorage.write(key: kUserInfo, value: jsonEncode(user));
  }

  /// Read token from local storage.
  Future<UserInfoModel?> readUserAccess() async {
    try {
      final user = await secureStorage.read(key: kUserInfo);
      if (user == null) return null;
      _userInfo = UserInfoModel.fromJson(jsonDecode(user));
      _authToken = _userInfo?.loginInfo?.accessToken;
      return _userInfo;
    } on PlatformException {
      await secureStorage.delete(key: kUserInfo);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
