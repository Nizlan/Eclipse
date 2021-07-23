import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  Future fetch() async {
    try {
      var response = await http.get(
          Uri.https("my-json-server.typicode.com", "/znol1/Eclipse/posts"));
      final List<Map<String, dynamic>> loaded = [];
      final extractedData =
          json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      final postsList = extractedData[0];
      print(postsList['title']);
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
