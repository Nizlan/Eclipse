import 'package:eclipse/models/user.dart';
import 'package:eclipse/providers/users_data.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiManager {
  Future fetch(context) async {
    try {
      var response = await http.get(
          Uri.https("my-json-server.typicode.com", "/znol1/Eclipse/users"));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      Provider.of<UsersData>(context, listen: false).fetchAndSet(jsonMap);
    } catch (error) {
      print(error);
    }
  }

  update(User user, String text) {
    // user.posts.comm
  }
}
