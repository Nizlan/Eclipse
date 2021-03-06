import 'package:eclipse/models/user.dart';
import 'package:eclipse/providers/users_data.dart';
import 'package:eclipse/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPostScreen extends StatefulWidget {
  final User user;
  final posts;
  const DetailPostScreen(this.user, this.posts);

  @override
  _DetailPostScreenState createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final _textController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(widget.posts.title),
                subtitle: Text(widget.posts.text),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Text(
                    'Комментарии',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                ]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            // Provider.of<Activities>(this.context, listen: false)
            //     .returnAdd(),
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                elevation: 20.0,
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(hintText: 'текст'),
                            controller: _textController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'имя'),
                            autofocus: true,
                            controller: _nameController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'email'),
                            autofocus: true,
                            controller: _emailController,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            Provider.of<UsersData>(this.context, listen: false)
                                .updateComments(
                                    widget.user,
                                    widget.posts,
                                    _textController.text,
                                    _nameController.text,
                                    _emailController.text);
                          }),
                          child: Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Отправить комментарий',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
        child: Icon(Icons.add),
      ),
    );
  }
}
