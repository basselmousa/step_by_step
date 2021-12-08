import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';


class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_White,
      body: Container(
        child: Column(
          children: [

                Text("الدور:  3  ", style: TextStyle(
                fontSize: FontConstants.TEXT_Font20,fontWeight: FontWeight.bold),),
                Text("المتبقي:  3  ", style: TextStyle(
                    fontSize: FontConstants.TEXT_Font20,fontWeight: FontWeight.bold)),

          ],
        )
      ),
    );
  }
}
