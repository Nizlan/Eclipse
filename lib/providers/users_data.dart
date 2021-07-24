import 'dart:convert';

import 'package:eclipse/models/user.dart';
import 'package:eclipse/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersData with ChangeNotifier {
  List<User> _users = [];
  SharedPreferences pref;
  List<User> get users {
    return [..._users];
  }

  User userById(id) {
    return _users.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAndSet() async {
    pref = await SharedPreferences.getInstance();
    pref.containsKey('users')
        ? getPreferences(pref.getString('users'))
        : getPreferences(await ApiManager().fetch());
    print(_users);
  }

  Future setPreferences() async {
    var string = await ApiManager().fetch();
    pref.setString('users', string);
  }

  Future getPreferences(string) async {
    var jsonMap = json.decode(string);
    for (var el in jsonMap) {
      var newEl = User.fromJson(el);
      _users.add(newEl);
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
