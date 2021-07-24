import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  final album;
  const Photos(this.album);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: widget.album.photos.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.album.photos[index].link),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Center(
              //   child: Text(
              //     widget.album[index].description,
              //     style: TextStyle(
              //         fontSize: 27,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
            );
          }),
    );
  }
}
