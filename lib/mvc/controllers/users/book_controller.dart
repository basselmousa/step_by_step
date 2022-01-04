import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_by_step/mvc/helpers/constants/firebase_collection_names_constants.dart';
import 'package:step_by_step/mvc/models/reservation_model.dart';
import 'package:step_by_step/mvc/utils/utils.dart';

class BookController {
  Stream<QuerySnapshot> getBooks() {
    Future.delayed(Duration.zero, ()=> fill());
    return FirebaseFirestore.instance.collection('books').snapshots();
  }

  Future<void> bookReservation(String id, BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance.collection(FirebaseCollectionNamesConstants.USER_COLLECTION_NAME)
        .doc(preferences.get('uid').toString()).get().then((value) {
      FirebaseFirestore.instance
          .collection(
          FirebaseCollectionNamesConstants.RESERVATIONS_COLLECTION_NAME)
          .doc()
          .set({
        'bookId': id,
        'userName' : value.data()['fullName'],
        'userNumber' :  value.data()['email'].toString().substring(0,  value.data()['email'].toString().indexOf('@')),
        'status' : 'pending'
      }).then((value) => buildSnackBar(context, "Your request is under review"));
    });

  }


  Future<void> fill()async{
    await FirebaseFirestore.instance.collection(FirebaseCollectionNamesConstants.RESERVATIONS_COLLECTION_NAME).get().then((value) {
      value.docs.forEach((element) {
        Reservation.fillReservations(Reservation.fromJSON(element.data()));

      });
    });
  }

}
