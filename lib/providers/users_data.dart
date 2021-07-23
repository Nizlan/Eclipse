import 'dart:convert';

import 'package:eclipse/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences pref = await SharedPreferences.getInstance();
    var isThere = false;
    for (var el in list) {
      var newEl = User.fromJson(el);
      for (var user in _users) {
        if (user.id == newEl.id) {
          isThere = true;
        }
      }
      if (!isThere) {
        pref.setString(newEl.id.toString(), jsonEncode(User.fromJson(el)));
        _users.add(User.fromJson(el));
      }
    }
  }
}
