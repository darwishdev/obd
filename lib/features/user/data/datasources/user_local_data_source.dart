import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/repositories/token_repository.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';

abstract class UserLocalDataSource {
  Future<void> cashUserData(UserInfoModel user);
  Future<Map<String, dynamic>?> getUserData();
}

final userLocalDataSourceImpl = Provider<UserLocalDataSourceImpl>(
    (ref) => UserLocalDataSourceImpl(ref.watch(tokenRepositoryProvider)));

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final TokenRepository _tokenRepository;
  UserLocalDataSourceImpl(this._tokenRepository);

  @override
  Future<void> cashUserData(UserInfoModel user) async {
    try {
      await _tokenRepository.saveUserAccess(user);
      log('cashed successfully');
    } catch (e, stackTrace) {
      log('cashing failed', error: e, stackTrace: stackTrace);
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserData() async {
    return _tokenRepository.readUserAccess();
  }
}
