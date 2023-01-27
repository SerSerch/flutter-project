import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile with ChangeNotifier {
  UniqueKey? id;

  UniqueKey? get getProfileID => id;

  Future<void> fetchProfile(key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('@token', 'token');
    id = key;
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('@token');
    id = null;
  }
}
