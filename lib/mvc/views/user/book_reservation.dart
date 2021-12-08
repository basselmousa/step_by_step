import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';

class BookReservation extends StatefulWidget {
  const BookReservation({Key? key}) : super(key: key);

  @override
  _BookReservationState createState() => _BookReservationState();
}

class _BookReservationState extends State<BookReservation> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("الغاء"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("تأكيد الحجز"),
      onPressed: () {},
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(100),
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'الاسم',
                        style: TextStyle(
                            fontSize: FontConstants.TEXT_Font20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'الوصف',
                        style: TextStyle(
                            fontSize: FontConstants.TEXT_Font20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'الحالة',
                        style: TextStyle(
                            fontSize: FontConstants.TEXT_Font20,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text("احجز"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.black45,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontConstants.TEXT_Font20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
