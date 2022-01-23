import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/controllers/admins/admin_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/models/admin_model.dart';


class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Admin.id);
    print(Admin.type);
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_grey,
      body: StreamBuilder<DocumentSnapshot>(
        stream: AdminController().getTurns(Admin.id),
        builder: (context, snapshot) {
          return  Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                      Text( getCurrentTurnString(snapshot.data!.data()['turn'] ?? 1), style: TextStyle(
                      fontSize: FontConstants.TEXT_Font20,fontWeight: FontWeight.bold),),
                      Text(getTurnString(snapshot.data!.data()['current'].toString()), style: TextStyle(
                          fontSize: FontConstants.TEXT_Font20,fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      AdminController().done(Admin.id);

                    },
                    child: Text("Done"),
                    style: ElevatedButton.styleFrom(
                      primary: ColorConstants.COLOR_Blue,
                      onPrimary: ColorConstants.COLOR_Black54,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: FontConstants.TEXT_Font20),
                    ),
                  )

                ],
              )
            ),
          );
        }
      ),
    );
  }

  getTurnString(turn){
    return "الدور : ${turn}";
  }
  getCurrentTurnString(turn){
    return "المتبقي : ${turn}";
  }
}
