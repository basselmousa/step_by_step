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

  DateTime? _expiryDate;
  Timer? _authTimer;

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
}
