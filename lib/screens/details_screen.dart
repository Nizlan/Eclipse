import 'package:eclipse/models/user.dart';
import 'package:eclipse/providers/users_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final id;
  const DetailsScreen(this.id);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  User user;
  @override
  void initState() {
    user =
        Provider.of<UsersData>(this.context, listen: false).userById(widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
      ),
      body: Column(
        children: [
          Text('name ${user.name}'),
          Text('email ${user.email}'),
          Text('phone ${user.phone.toString()}'),
          Text('website ${user.website}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('working'),
              Text(user.working.name),
              Text(user.working.bs),
              Text(user.working.catchPhrase),
            ],
          ),
          Text('address ${user.address}'),
          Container(
            padding: EdgeInsets.all(10),
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
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: user.posts.length >= 3
                ? Column(
                    children: [
                      Text(user.posts[0].title),
                      Text(user.posts[1].title),
                      Text(user.posts[2].title),
                    ],
                  )
                : Text('Здесь будут появляться ваши посты'),
          ),
        ],
      ),
    );
  }
}
