import 'package:eclipse/models/user.dart';
import 'package:eclipse/screens/detail_post_screen.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  final User user;
  const PostsScreen(this.user);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.user.posts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPostScreen(widget.user, widget.user.posts[index]),
                ),
              ),
              child: Card(
                child: ListTile(
                  title: Text(widget.user.posts[index].title),
                  subtitle: Text(
                      '${widget.user.posts[index].text.substring(1, 60)} ...'),
                ),
              ),
            );
          }),
    );
  }
}
