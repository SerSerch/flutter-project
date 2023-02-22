import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String? _firstName;
  String? _lastName;
  String? _email;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;

  void updateUser({
    String? firstName,
    String? lastName,
    String? email,
  }) {
    notifyListeners();
  }
}
