import 'package:eclipse/models/user.dart';
import 'package:flutter/material.dart';

class UsersData with ChangeNotifier {
  List<User> _users = [];
  List<User> get activities {
    return [..._users];
  }

  Future<void> fetchAndSet(list) async {
    for (var el in list) {
      _users.add(User.fromJson(el));
    }
  }
}
