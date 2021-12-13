import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminController {
  static Future<void> addOrUpdateRole({
  required BuildContext context,
    required String id
}) async{
    await FirebaseFirestore.instance.collection('roles').doc(id).get().then((value){
      print(value.data() == null);
   if(value.data() != null) {
     var turn = value.data()['turn'] ?? 0;
     FirebaseFirestore.instance.collection('roles').doc(value.id).update({
       'turn': turn + 1
     });
   }
   else{
     FirebaseFirestore.instance.collection('roles').doc(value.id).set({
       'turn': 1
     });
   }

    });
    // await FirebaseFirestore.instance.collection('roles').get().then((value) {
    //   if(value.docs.isNotEmpty ) {
    //
    //
    //     for (var i in value.docs) {
    //       if (i.id.toString() == id.toString()) {
    //         print(i.id);
    //         var turn = i.data()['turn'];
    //         // print(i.data()['turn']);
    //         FirebaseFirestore.instance.collection('roles').doc(id).update({
    //           'turn': turn+1
    //         }).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
    //             SnackBar(content: Text('Updated!'))));
    //       }
    //       else {
    //         print('inside');
    //         FirebaseFirestore.instance.collection('roles').doc(id).set({
    //           'turn': 1
    //         }).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
    //             SnackBar(content: Text('Inserted!'))));
    //       }
    //     }
    //   }else{
    //     print('outside');
    //      FirebaseFirestore.instance.collection('roles').doc(id).set({
    //       'turn': 1
    //     }).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
    //          SnackBar(content: Text('Inserted!'))));
    //
    //   }
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Done!')));
    // }).catchError((onError)=> print(onError.toString()));

  }

}