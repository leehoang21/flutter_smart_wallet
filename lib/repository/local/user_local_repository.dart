import 'dart:convert';

import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalRepository {
  Future<UserModel?> getUser() async {
    return _getUserFromLocal();
  }

  Future<void> saveUser(UserModel user) async {
    await _saveUserToLocal(user);
  }

  Future<void> singout() async {
    await _singoutUserToLocal();
  }

  Future<void> _singoutUserToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  Future<void> _saveUserToLocal(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toJson()));
  }

  Future<UserModel?> _getUserFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      return UserModel.fromJson(json.decode(userJson));
    } else {
      return null;
    }
  }
}
