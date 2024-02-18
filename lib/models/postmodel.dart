// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  UserId userId;
  String post;
  DateTime postedDate;

  Post({
    required this.userId,
    required this.post,
    required this.postedDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: UserId.fromJson(json["userId"]),
    post: json["post"],
    postedDate: DateTime.parse(json["postedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId.toJson(),
    "post": post,
    "postedDate": postedDate.toIso8601String(),
  };
}

class UserId {
  String name;
  String mobile;
  String address;

  UserId({
    required this.name,
    required this.mobile,
    required this.address,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    name: json["name"],
    mobile: json["mobile"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobile": mobile,
    "address": address,
  };
}