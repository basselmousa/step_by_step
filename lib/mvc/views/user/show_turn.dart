import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';

class ShowTurn extends StatefulWidget {
  const ShowTurn({Key? key}) : super(key: key);

  @override
  _ShowTurnState createState() => _ShowTurnState();
}

class _ShowTurnState extends State<ShowTurn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_White,
      body:   Center(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text( 'Turn', style: TextStyle(
                          fontSize: FontConstants.TEXT_Font20,fontWeight: FontWeight.bold),),
                      Text('current', style: TextStyle(
                          fontSize: FontConstants.TEXT_Font20,fontWeight: FontWeight.bold)),

                    ],
                  )
              ),
            ),

      );

  }
}
