import 'package:eclipse/providers/users_data.dart';
import 'package:eclipse/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(Duration.zero).then((value) => ApiManager().fetch(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiManager().fetch(context),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<UsersData>(
                  builder: (context, activities, ch) => ListView.builder(
                      itemCount:
                          Provider.of<UsersData>(this.context, listen: false)
                                  .users
                                  .length -
                              1,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(Provider.of<UsersData>(this.context,
                                  listen: false)
                              .users[index]
                              .name),
                        );
                      }),
                )),
    );
  }
}
