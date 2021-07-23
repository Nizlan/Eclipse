// To parse this JSON data, do
//
//     final User = UserFromJson(jsonString);

import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.working,
    this.address,
    this.title,
    this.posts,
    this.albums,
  });

  int id;
  String name;
  String username;
  String email;
  int phone;
  String website;
  Working working;
  String address;
  String title;
  List<Post> posts;
  List<Album> albums;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
        working: Working.fromJson(json["working"]),
        address: json["address"],
        title: json["title"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        albums: List<Album>.from(json["albums"].map((x) => Album.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "website": website,
        "working": working.toJson(),
        "address": address,
        "title": title,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "albums": List<dynamic>.from(albums.map((x) => x.toJson())),
      };
}

class Album {
  Album({
    this.description,
    this.photos,
  });

  String description;
  List<Photo> photos;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        description: json["description"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class Photo {
  Photo({
    this.link,
  });

  String link;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
      };
}

class Post {
  Post({
    this.title,
    this.text,
    this.comments,
  });

  String title;
  String text;
  List<Comment> comments;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        text: json["text"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.name,
    this.email,
    this.text,
  });

  String name;
  String email;
  String text;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        name: json["name"],
        email: json["email"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "text": text,
      };
}

class Working {
  Working({
    this.name,
    this.bs,
    this.catchPhrase,
  });

  String name;
  String bs;
  String catchPhrase;

  factory Working.fromJson(Map<String, dynamic> json) => Working(
        name: json["name"],
        bs: json["bs"],
        catchPhrase: json["catchPhrase"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bs": bs,
        "catchPhrase": catchPhrase,
      };
}
