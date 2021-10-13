// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Post> postsFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.thumbnail,
  });

  int id;
  String title;
  String description;
  String content;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  Thumbnail thumbnail;

  var isFavorite = false.obs;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        content: json["content"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "content": content,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "thumbnail": thumbnail.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    required this.width,
    required this.height,
    required this.url,
  });

  int width;
  int height;
  String url;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
      };
}
