import 'dart:convert';

import 'package:eclipse/models/user.dart';
import 'package:eclipse/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersData with ChangeNotifier {
  List<User> _users = [];
  SharedPreferences pref;
  List<User> get users {
    return [..._users];
  }

  userById(id) {
    User user = _users.firstWhere((element) => element.id == id);
    return user;
  }

  setPreferences() async {
    var users = await ApiManager().fetch();
    pref.setString('users', users);
    pref.setBool('isReceived', true);
  }

  checker() async {
    pref = await SharedPreferences.getInstance();
    if (pref.getBool('isReceived') == null) {
      setPreferences();
    }
  }

  Future<void> fetchAndSet() async {
    Future.delayed(Duration.zero)
        .then((value) => checker())
        .then((value) => getPreferences());
  }

  Future getPreferences() async {
    var jsonMap = json.decode(pref.getString('users'));
    var isThere = false;
    for (var el in jsonMap) {
      var newEl = User.fromJson(el);
      for (var user in _users) {
        if (user.id == newEl.id) {
          isThere = true;
        }
      }
      if (!isThere) {
        _users.add(newEl);
      }
    }
  }

  update(User user, post, String text, String name, String email) {}
}
