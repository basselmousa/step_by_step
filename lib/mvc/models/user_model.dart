import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User with ChangeNotifier {
  String idNumber;
  String fullName;
  String password;
  String? uid;
  static String id = '';
  static int _turn = 0;

  static int get turn => _turn;

  static set turn(int value) {
    _turn = value;
  }

  User(
      {required this.fullName,
      required this.idNumber,
      required this.password,
       this.uid});

  User.fromJSON(Map<String, dynamic> json)
      : this(
          fullName: json["fullName"],
          idNumber: json["idNumber"],
          password: json["password"],
          uid: json["uid"],
        );

  Map<String, Object?> toJson() {
    return {
      "fullName": fullName,
      "idNumber": idNumber,
      "password": password,
      "uid": uid,
    };
  }

  static getId() async{
    SharedPreferences preferences =  await SharedPreferences.getInstance();
    String _id = preferences.get('email').toString().substring(0, preferences.get('email').toString().indexOf('@'));
    id = _id;
  }
}
