import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildContainer("حجز دور", (){moveScreen(context, RoutesConstants.APPOINTMENT_BOOKING_ROUTE_PATH);}),
            buildContainer("حجز كتاب", (){moveScreen(context, RoutesConstants.LOGIN_ROUTE_PATH);}),

          ],
        ),
      ),
    );
  }
}
