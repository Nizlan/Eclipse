import 'package:eclipse/models/user.dart';
import 'package:eclipse/providers/users_data.dart';
import 'package:eclipse/screens/albums_screen.dart';
import 'package:eclipse/screens/posts_screen.dart';
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Text(user.name),
          Text(user.email),
          Text(user.phone.toString()),
          Text(user.website),
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
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PostsScreen(user))),
            child: Container(
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
                        ListTile(
                          title: Text(user.posts[0].title),
                          subtitle: Text(
                              '${user.posts[0].text.substring(1, 50)} ...'),
                        ),
                        ListTile(
                          title: Text(user.posts[1].title),
                          subtitle: Text(
                              '${user.posts[1].text.substring(1, 50)} ...'),
                        ),
                        ListTile(
                          title: Text(user.posts[2].title),
                          subtitle: Text(
                              '${user.posts[2].text.substring(1, 50)} ...'),
                        ),
                      ],
                    )
                  : Text('Здесь будут появляться ваши посты'),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AlbumsScreen(user.albums))),
            child: Container(
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
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                          width: 100,
                          child: Image(
                              image:
                                  NetworkImage(user.albums[0].photos[0].link))),
                      Text(user.albums[0].description),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
