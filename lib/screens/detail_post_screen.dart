import 'package:eclipse/models/user.dart';
import 'package:flutter/material.dart';

class DetailPostScreen extends StatefulWidget {
  final User user;
  final posts;
  const DetailPostScreen(this.user, this.posts);

  @override
  _DetailPostScreenState createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.posts.title),
              subtitle: Text(widget.posts.text),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                  itemCount: widget.posts.comments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            '${widget.posts.comments[index].name} (${widget.posts.comments[index].email})'),
                        subtitle: Text(widget.posts.comments[index].text),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
