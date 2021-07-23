import 'package:eclipse/models/user.dart';
import 'package:flutter/material.dart';

class UsersData with ChangeNotifier {
  List<User> _users = [];
  List<User> get users {
    return [..._users];
  }

  userById(id) {
    User user = _users.firstWhere((element) => element.id == id);
    return user;
  }

  Future<void> fetchAndSet(list) async {
    var isThere = false;
    for (var el in list) {
      var newEl = User.fromJson(el);
      for (var user in _users) {
        if (user.id == newEl.id) {
          isThere = true;
        }
      }
      if (!isThere) {
        _users.add(User.fromJson(el));
      }
    }
  }
}
