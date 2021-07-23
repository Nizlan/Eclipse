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
      // print(userModel.name);
      // final List<Map<String, dynamic>> loaded = [];
      // final extractedData =
      //     json.decode(utf8.decode(response.bodyBytes)) as List;
      // final postsList = extractedData[0]["email"];
      // print(postsList);
      // print(loaded);
      // extractedData.forEach((element) {
      //   element.forEach((id, data) {
      //     loadedPlaces.add(
      //         Place(data['id'], data['name'], data['location'], data['price']));
      //     Future.delayed(Duration(microseconds: 50))
      //         .then((value) => print(loadedPlaces));
      //   });
      // });
    } catch (error) {
      print(error);
    }
  }
}
