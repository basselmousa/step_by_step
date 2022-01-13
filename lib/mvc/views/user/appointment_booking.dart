import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/controllers/admins/admin_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/admins_id_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/helpers/routes/app_routes.dart';
import 'package:step_by_step/mvc/models/user_model.dart';
import 'package:step_by_step/mvc/utils/utils.dart';
import 'package:step_by_step/mvc/views/widgets/container_widget.dart';

class AppointmentBooking extends StatefulWidget {
  @override
  _AppointmentBookingState createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  showAlertDialog(BuildContext context, String id, String name) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("الغاء"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("تأكيد الحجز"),
      onPressed: () async{
       await AdminController.addOrUpdateRole(context: context, id: id, func: (int turn) => setState((){
          User.turn = turn;
        })).then(
            (value) => moveScreen(context, RoutesConstants.SHOW_TURN_ROUTE_PATH,
                replacement: false, data: {'id': id})).whenComplete(() {
                  setState(() {

                  });
       });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("حجز كتاب"),
      content: Text("هل تود تأكيد حجزك مع $name"),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    User.turn = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 150, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer(
                  "العميد",
                  () => showAlertDialog(context,
                      "${AdminIdConstants.ADMINS_ID['dean']}", "العميد"),
                ),
                buildContainer("رئيس القسم", () {
                  showAlertDialog(
                      context,
                      "${AdminIdConstants.ADMINS_ID['headofdepartment']}",
                      "رئيس القسم");
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer("القبول والتسجيل", () {
                  showAlertDialog(
                      context,
                      "${AdminIdConstants.ADMINS_ID['admissions']}",
                      "القبول والتسجيل");
                }),
                buildContainer("مالية", () {
                  showAlertDialog(context,
                      "${AdminIdConstants.ADMINS_ID['finance']}", "مالية");
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer("شؤون الطلبة", () {
                  showAlertDialog(
                      context,
                      "${AdminIdConstants.ADMINS_ID['deanshipofstudentaffairs']}",
                      "شؤون الطلبة");
                }),
                buildContainer("المركز الصحي", () {
                  showAlertDialog(
                      context,
                      "${AdminIdConstants.ADMINS_ID['healthcenter']}",
                      "المركز الصحي");
                }),
              ],
            ),
          ),
          Center(
            child: buildContainer("خدمة العلم", () {
              showAlertDialog(
                  context,
                  "${AdminIdConstants.ADMINS_ID['militaryservice']}",
                  "خدمة العلم");
            }),
          )
        ],
      ),
    );
  }
}
