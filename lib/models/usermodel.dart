// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  String userName;
  String userPhone;
  String userEmail;
  String userPword;

  Users({
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.userPword,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    userName: json["userName"],
    userPhone: json["userPhone"],
    userEmail: json["userEmail"],
    userPword: json["userPword"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "userPhone": userPhone,
    "userEmail": userEmail,
    "userPword": userPword,
  };
}
