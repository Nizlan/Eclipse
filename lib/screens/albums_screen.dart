import 'package:eclipse/screens/photos.dart';
import 'package:flutter/material.dart';

class AlbumsScreen extends StatefulWidget {
  final albums;
  const AlbumsScreen(this.albums);

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: widget.albums.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Photos(widget.albums[index]))),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.albums[index].photos[0].link),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.albums[index].description,
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
