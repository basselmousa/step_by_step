import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';

TextField editTextWithCenterAlign(controller, String hint, ) {
  return TextField(
    controller: controller,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: ColorConstants.COLOR_Black54),),


  );
}


