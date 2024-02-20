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
  String userName;
  String userPhone;
  String userEmail;

  UserId({
    required this.userName,
    required this.userPhone,
    required this.userEmail,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    userName: json["userName"],
    userPhone: json["userPhone"],
    userEmail: json["userEmail"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "userPhone": userPhone,
    "userEmail": userEmail,
  };
}
