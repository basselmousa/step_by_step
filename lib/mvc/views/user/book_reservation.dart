import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/controllers/users/book_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/models/reservation_model.dart';
import 'package:step_by_step/mvc/models/user_model.dart';

class BookReservation extends StatefulWidget {
  const BookReservation({Key? key}) : super(key: key);

  @override
  _BookReservationState createState() => _BookReservationState();
}

class _BookReservationState extends State<BookReservation> {
  showAlertDialog(BuildContext context, String id) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("الغاء"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("تأكيد الحجز"),
      onPressed: () {
        BookController().bookReservation(id, context).then((value) =>
            Navigator.of(context).pop());
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("حجز كتاب"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    User.getId();
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: BookController().getBooks(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: ListView.builder(
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) {
                    print(User.id);
                    return Padding(
                        padding: const EdgeInsets.all(100),
                        child: Center(
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      snapshot.data!.docs[index]
                                          .data()['imagePath'],
                                      width: 150,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'الاسم' +
                                              snapshot.data!.docs[index]
                                                  .data()['name'],
                                          style: TextStyle(
                                              fontSize:
                                              FontConstants.TEXT_Font20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'الوصف' +
                                              snapshot.data!.docs[index]
                                                  .data()['description'],
                                          style: TextStyle(
                                              fontSize:
                                              FontConstants.TEXT_Font20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'الحالة' +
                                              snapshot.data!.docs[index]
                                                  .data()['status'],
                                          style: TextStyle(
                                              fontSize:
                                              FontConstants.TEXT_Font20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Center(
                                  child:Reservation.reservations[snapshot
                                      .data!.docs[index].id]['userNumber'] ==
                                      User.id ? Text(
                                      Reservation.reservations[snapshot.data!.docs[index].id]['status'],
                                    style: TextStyle(color: ColorConstants.statusColors[ Reservation.reservations[snapshot.data!.docs[index].id]['status']], fontSize: 25),):
                                  ElevatedButton(
                                    onPressed: () {
                                      showAlertDialog(context,
                                          snapshot.data!.docs[index].id);
                                    },
                                    child: Text('احجز'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      onPrimary: Colors.black45,
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontConstants.TEXT_Font20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                  },
                ),
              );
            }),
      ),
    );
  }
}
