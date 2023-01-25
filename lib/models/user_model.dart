import 'dart:html';

import 'package:flutter/cupertino.dart';

class UserModel {
  final String useriId;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  //File file;

  UserModel({
    required this.useriId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        useriId: json['userId'],
        firstName: json['firstname'],
        lastName: json['lastname'],
        phone: json['phone'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'userId': phone,
        'firstname': firstName,
        'lastname': lastName,
        'phone': phone,
        'email': email,
        'password': password,
      };
}
