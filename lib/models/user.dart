// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserModel {
  final String username;
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String gender;
  final String image;

  UserModel(  {
    required this.image,
    required this.username,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.gender,
  });
}
