import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/helpers/routes/app_routes.dart';
import 'package:step_by_step/mvc/utils/utils.dart';
import 'package:step_by_step/mvc/views/widgets/edit_text_widget.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _idController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_White,
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorConstants.COLOR_White,
                child: editTextWithCenterAlign(_idController, "ID Number"),
                margin: EdgeInsets.only(left: 50, right: 50, top: 90),
              ),
              Container(
                color: ColorConstants.COLOR_White,
                child: editTextWithCenterAlign(_passwordController, "password"),
                margin: EdgeInsets.only(left: 50, right: 50, top: 30),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () { moveScreen(context, RoutesConstants.BOOK_RESERVATION_ROUTE_PATH);},
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.COLOR_White,
                    onPrimary: ColorConstants.COLOR_Black54,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontConstants.TEXT_Font20),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
