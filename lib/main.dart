import 'package:eclipse/providers/users_data.dart';
import 'package:eclipse/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UsersData(),
      child: MaterialApp(
        title: 'Eclipse',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UsersScreen(),
      ),
    );
  }
}
