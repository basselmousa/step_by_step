import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_by_step/mvc/controllers/users/users_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/image_constatns.dart';
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
  bool tryLoginIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // autoLogin();
  }

  void autoLogin() async {
    setState(() {
      tryLoginIn = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // await preferences.clear();
    if (preferences.getString("email") != null &&
        preferences.getString("password") != null) {
      await UserController()
          .login(preferences.getString("email").toString(),
              preferences.getString("password").toString(), context)
          .whenComplete(() => setState(() {
                tryLoginIn = false;
              }));

      return;
    }
    setState(() {
      tryLoginIn = false;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_grey,
      body: tryLoginIn
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(

        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.backGround),
              fit: BoxFit.cover),
          border: Border.all(
              color: Colors.black, // Set border color
              width: 3.0), // Set border width
          // Set rounded corner radius
        ),
              padding: EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorConstants.COLOR_White,
                  border: Border.all(
                      color: Colors.black, // Set border color
                      width: 3.0),


                  ),

                      child:
                          editTextWithCenterAlign(_idController, "ID Number"),
                      margin: EdgeInsets.only(left: 50, right: 50, top: 90),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorConstants.COLOR_White,

                        border: Border.all(
                            color: Colors.black, // Set border color
                            width: 3.0),


                      ),
                      child: editTextWithCenterAlign(
                          _passwordController, "password",password: true),
                      margin: EdgeInsets.only(left: 50, right: 50, top: 30),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          // moveScreen(context, RoutesConstants.LIBRARY_ADMIN_ROUTE_PATH);

                          if (validated()) {
                            UserController().login(
                                returnEmail(_idController.text),
                                _passwordController.text,
                                context);
                          }
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: ColorConstants.COLOR_Black54,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontConstants.TEXT_Font20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        onPressed: () {
                          moveScreen(
                              context, RoutesConstants.REGISTRATION_ROUTE_PATH);
                        },
                        child: Text(
                          "Create account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontConstants.TEXT_Font20,color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  bool validated() {
    if (_idController.text.isEmpty) {
      buildSnackBar(context, "ID is required");
      return false;
    }
    if (_passwordController.text.isEmpty) {
      buildSnackBar(context, "Password is required");
      return false;
    }

    return true;
  }
}
