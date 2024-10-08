import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/firebase_collection_names_constants.dart';
import 'package:step_by_step/mvc/models/book_model.dart';
import 'package:step_by_step/mvc/models/user_model.dart' as User;
import 'package:step_by_step/mvc/utils/utils.dart';

class AdminController {
  static Future<void> addOrUpdateRole(
      {required BuildContext context, required String id, required Function (int) func}) async {
    await FirebaseFirestore.instance
        .collection('roles')
        .doc(id)
        .get()
        .then((value) {
      print(value.data() == null);
      if (value.data() != null ) {
        var turn = value.data()['turn']  ?? 0;
        var current = value.data()['current'] ?? 0;
        if(value.data()['current'] != null  &&  value.data()['current'] > value.data()['turn'] ){
          current = 0;
        }
          FirebaseFirestore.instance
              .collection('roles')
              .doc(value.id)
              .update({'turn': turn + 1,'current' : current}).then((_) {
            FirebaseFirestore.instance
                .collection(
                FirebaseCollectionNamesConstants.ROLES_COLLECTION_NAME)
                .doc(id)
                .get()
                .then((value) => func(value.data()['turn']));
          });

      } else {
        FirebaseFirestore.instance
            .collection('roles')
            .doc(value.id)
            .set({'turn': 1,'current' : 0}).then((value) =>  func(1));
      }
    });
  }

  Stream<DocumentSnapshot> getTurns(String id) {
    return FirebaseFirestore.instance.collection('roles').doc(id).snapshots();
  }

  Future<void> done(String id) async {
    await FirebaseFirestore.instance
        .collection('roles')
        .doc(id)
        .get()
        .then((value) {
      FirebaseFirestore.instance.collection('roles').doc(value.id).update({

        'current':
            value.data()['current'] != null ? value.data()['current'] + 1 : 1
      });
    });
  }

  Future<void> addBook(Book book, File image, BuildContext context) async {
    book.imagePath = await _uploadImage(image);
    await FirebaseFirestore.instance
        .collection('books')
        .doc()
        .set(book.toJSON())
        .then((value) => buildSnackBar(context, "Book Added"));
  }

  static Future<String> _uploadImage(File image) async {
    String path = image.toString().substring(image.toString().indexOf('P'));
    var fileName = await FirebaseStorage.instance.ref(path).putFile(image);

    return await fileName.ref.getDownloadURL();
  }

  Stream<QuerySnapshot> getReservations() {
    return FirebaseFirestore.instance
        .collection(
            FirebaseCollectionNamesConstants.RESERVATIONS_COLLECTION_NAME)
        .where('status', isEqualTo: 'pending')
        .snapshots();
  }

  Future<void> reservedBook(
      String id, String status, BuildContext context) async {
    if (status == 'success') {
      await FirebaseFirestore.instance
          .collection(
              FirebaseCollectionNamesConstants.RESERVATIONS_COLLECTION_NAME)
          .doc(id)
          .update({'status': status}).then((value) {
        buildSnackBar(context, "Book Status Updated");
      });
    } else {
      await FirebaseFirestore.instance
          .collection(
              FirebaseCollectionNamesConstants.RESERVATIONS_COLLECTION_NAME)
          .doc(id)
          .delete()
          .then((value) {
        buildSnackBar(context, "Book Status Updated");
      });
    }
  }



}
