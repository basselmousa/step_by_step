import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/controllers/admins/admin_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/admins_id_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/image_constatns.dart';
import 'package:step_by_step/mvc/helpers/routes/app_routes.dart';
import 'package:step_by_step/mvc/models/role_model.dart';
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
      onPressed: () async {
        await AdminController.addOrUpdateRole(
            context: context,
            id: id,
            func: (int turn) => setState(() {
                  User.turn = turn;
                })).then((value) {
          Role.type = id;
          return moveScreen(context, RoutesConstants.SHOW_TURN_ROUTE_PATH,
              replacement: false, data: {'id': id});
        }).whenComplete(() {
          setState(() {});
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("حجز دور"),
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
      appBar: AppBar(
        title: Text('حجز دور'),
        centerTitle: true,
      ),
      backgroundColor: ColorConstants.COLOR_grey,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.backGround),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 4.0),
                  ),
                  child: buildContainer(
                    "العميد",
                    () => showAlertDialog(context,
                        "${AdminIdConstants.ADMINS_ID['dean']}", "العميد"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 4.0),
                  ),
                  child: buildContainer("رئيس القسم", () {
                    showAlertDialog(
                        context,
                        "${AdminIdConstants.ADMINS_ID['headofdepartment']}",
                        "رئيس القسم");
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 4.0),
                  ),
                  child: buildContainer("القبول والتسجيل", () {
                    showAlertDialog(
                        context,
                        "${AdminIdConstants.ADMINS_ID['admissions']}",
                        "القبول والتسجيل");
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 4.0),
                  ),
                  child: buildContainer("مالية", () {
                    showAlertDialog(context,
                        "${AdminIdConstants.ADMINS_ID['finance']}", "مالية");
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 4.0),
                  ),
                  child: buildContainer("شؤون الطلبة", () {
                    showAlertDialog(
                        context,
                        "${AdminIdConstants.ADMINS_ID['deanshipofstudentaffairs']}",
                        "شؤون الطلبة");
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 4.0),
                  ),
                  child: buildContainer("المركز الصحي", () {
                    showAlertDialog(
                        context,
                        "${AdminIdConstants.ADMINS_ID['healthcenter']}",
                        "المركز الصحي");
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 4.0),
                  ),
                  child: buildContainer("خدمة العلم", () {
                    showAlertDialog(
                        context,
                        "${AdminIdConstants.ADMINS_ID['militaryservice']}",
                        "خدمة العلم");
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
