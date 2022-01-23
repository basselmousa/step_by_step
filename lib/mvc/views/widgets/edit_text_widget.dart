import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';

TextField editTextWithCenterAlign(controller, String hint,{bool password = false} ) {
  return TextField(
    obscureText: password,
    controller: controller,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
        hintText: hint,
        hintStyle: TextStyle(color: ColorConstants.COLOR_Black54),),


  );
}


