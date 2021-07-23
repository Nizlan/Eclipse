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
        title: Text(user.username),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Имя: ${user.name}'),
                  Text('Email: ${user.email}'),
                  Text('Номер: ${user.phone.toString()}'),
                  Text('Сайт: ${user.website}'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(246, 240, 234, 0.5),
                    Color.fromRGBO(241, 223, 209, 0.5),
                  ],
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Работа',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(user.working.name),
                  Text(user.working.bs),
                  Text(
                    user.working.catchPhrase,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text('Адрес: ${user.address}'),
            ),
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
                child: Column(
                  children: [
                    Text(
                      'Посты',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: user.posts.length >= 3
                          ? ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(user.posts[index].title),
                                  subtitle: Text(
                                      '${user.posts[index].text.substring(1, 50)} ...'),
                                );
                              })
                          : ListView.builder(
                              itemCount: user.posts.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(user.posts[index].title),
                                  subtitle: Text(
                                      '${user.posts[index].text.substring(1, 50)} ...'),
                                );
                              }),
                    ),
                  ],
                ),
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
                child: Column(children: [
                  Text(
                    'Альбомы',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: user.albums.length >= 3
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 120,
                                height: 120,
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          user.albums[index].photos[0].link),
                                      width: 100.0,
                                      height: 100.0,
                                    ),
                                    Text(user.albums[index].description),
                                  ],
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: user.albums.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          user.albums[index].photos[0].link),
                                      width: 100.0,
                                      height: 100.0,
                                    ),
                                    Text(user.albums[index].description),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
