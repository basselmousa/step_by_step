import 'package:step_by_step/mvc/helpers/constants/firebase_collection_names_constants.dart';
import 'package:step_by_step/mvc/helpers/routes/app_routes.dart';
import 'package:step_by_step/mvc/models/user_model.dart' as Model;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_by_step/mvc/utils/utils.dart';

class UserController {
  Future<void> signUp(String idNumber, String password, String fullName, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: idNumber, password: password);
      print(userCredential);

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionNamesConstants.USER_COLLECTION_NAME)
          .doc(userCredential.user.uid)
          .set({
        "fullName": fullName,
        "email": idNumber,
        "password": password,
        "isAdmin":false,
      },);
      buildSnackBar(context, "User Created");

      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      sharedPreferences.setString("email", idNumber);
      sharedPreferences.setString("password", password);
      sharedPreferences.setString("uid", userCredential.user.uid);

      /**
       * Move to user Screen
       */
      moveScreen(context, RoutesConstants.LOGIN_ROUTE_PATH);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        buildSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        buildSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> login(String email, String password,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      sharedPreferences.setString("email", email);
      sharedPreferences.setString("password", password);
      sharedPreferences.setString("uid", userCredential.user.uid);
      buildSnackBar(context, "Logged In");
      print(userCredential.user.metadata);
     // userCredential.user.
      // if(userCredential.user['isAdmin']){
      //
      // }
      // moveScreen(context, RoutesConstants.BOOK_RESERVATION_ROUTE_PATH);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        buildSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        buildSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

  resetPassword(String email, BuildContext context) async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).whenComplete(() => buildSnackBar(context, "reseated"));

  }

}
