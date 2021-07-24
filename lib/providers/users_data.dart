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
    Future.delayed(Duration(microseconds: 10))
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

  updateComments(User user, post, String text, String name, String email) {
    var userId = _users.indexWhere((element) => element.id == user.id);
    var postId = _users[userId]
        .posts
        .indexWhere((element) => element.title == post.title);
    _users[userId]
        .posts[postId]
        .comments
        .add(Comment(name: name, email: email, text: text));
    var jsonUsers = json.encode(_users.map((e) => e.toJson()).toList());
    pref.setString('users', jsonUsers);
    ApiManager().addComent(jsonUsers);
  }
}
