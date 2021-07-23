import 'package:eclipse/providers/users_data.dart';
import 'package:eclipse/screens/details_screen.dart';
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
          future:
              Provider.of<UsersData>(this.context, listen: false).fetchAndSet(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<UsersData>(
                  builder: (context, activities, ch) => ListView.builder(
                      itemCount:
                          Provider.of<UsersData>(this.context, listen: false)
                              .users
                              .length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      Provider.of<UsersData>(this.context,
                                              listen: false)
                                          .users[index]
                                          .id))),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'username: ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      Provider.of<UsersData>(this.context,
                                              listen: false)
                                          .users[index]
                                          .username,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'name: ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      Provider.of<UsersData>(this.context,
                                              listen: false)
                                          .users[index]
                                          .name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
    );
  }
}
