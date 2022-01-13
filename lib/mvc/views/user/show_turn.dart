import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/controllers/users/users_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/models/user_model.dart';

class ShowTurn extends StatefulWidget {
  const ShowTurn({Key? key}) : super(key: key);

  @override
  _ShowTurnState createState() => _ShowTurnState();
}

class _ShowTurnState extends State<ShowTurn> {
  @override
  Widget build(BuildContext context) {
    print(User.turn);
    Map<String, dynamic > aID = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_White,
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: UserController().getTurn(aID['id'], false),
              builder: (context, snapshot) {
                return Wrap(children: [
                  Text(
                    'Turn',
                    style: TextStyle(
                        fontSize: FontConstants.TEXT_Font20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                        fontSize: FontConstants.TEXT_Font20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    snapshot.data!.data()['turn'].toString(),
                    style: TextStyle(
                        fontSize: FontConstants.TEXT_Font20,
                        fontWeight: FontWeight.bold),
                  ),

                ]);
              }
            ),
            StreamBuilder<DocumentSnapshot>(
              stream: UserController().getTurn(aID['id']),
              builder: (context, snapshot) {
                return ! snapshot.hasData ? CircularProgressIndicator(): Text('current : ' + snapshot.data!.data()['current'].toString() ,
                    style: TextStyle(
                        fontSize: FontConstants.TEXT_Font20,
                        fontWeight: FontWeight.bold));
              }
            ),
          ],
        )),
      ),
    );
  }
}
