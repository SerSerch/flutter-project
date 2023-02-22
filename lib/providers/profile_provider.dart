import 'package:flutter/material.dart';
import 'package:fluttertest/models/profile_settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile with ChangeNotifier {
  static String? id;
  ProfileSettings? _settings;

  String get sid => id ?? '';
  ProfileSettings get settings => _settings ?? {} as ProfileSettings;

  set setSettings(settings) => _settings = ProfileSettings.from(settings);

  Future<void> fetchProfile() async {
    // final prefs = await SharedPreferences.getInstance();
    // final String token = prefs.getString('@token')!;
    // prefs.setString('@token', 'token');
    // prefs.remove('@token');
    id = 'new-id';
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('@token');
    id = null;
  }
}
