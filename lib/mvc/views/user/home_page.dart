import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/image_constatns.dart';
import 'package:step_by_step/mvc/helpers/routes/app_routes.dart';
import 'package:step_by_step/mvc/utils/utils.dart';
import 'package:step_by_step/mvc/views/widgets/container_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_grey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.backGround),
              fit: BoxFit.cover),
          border: Border.all(
              color: Colors.black, // Set border color
              width: 3.0), // Set border width
          // Set rounded corner radius
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( height: 150,
              width: 150,
              decoration: BoxDecoration
                (

                border: Border.all(
                    color: Colors.black, // Set border color
                    width: 3.0), // Set border width
                // Set rounded corner radius
              ),child: buildContainer("حجز دور", (){moveScreen(context, RoutesConstants.APPOINTMENT_BOOKING_ROUTE_PATH,replacement: false);})),
              Padding(padding: EdgeInsets.all(20)),Container(height: 150,
                width: 150,
                decoration: BoxDecoration
                  (

                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 3.0), ),child: buildContainer("حجز كتاب", (){moveScreen(context, RoutesConstants.LOGIN_ROUTE_PATH);})),

            ],
          ),
        ),
      ),
    );
  }
}
