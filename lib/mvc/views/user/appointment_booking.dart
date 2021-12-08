import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/utils/utils.dart';
import 'package:step_by_step/mvc/views/widgets/container_widget.dart';
class AppointmentBooking extends StatefulWidget {

  @override
  _AppointmentBookingState createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150,left: 15,right: 15,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer("العميد", (){}),
                buildContainer("رئيس القسم", (){}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                buildContainer("القبول والتسجيل", (){}),
                buildContainer("مالية", (){}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                buildContainer("شؤون الطلبة", (){}),
                buildContainer("المركز الصحي", (){}),
              ],
            ),
          ),
          Center(
            child: buildContainer("خدمة العلم", (){}),
          )

        ],
      ),
    );
  }
}
