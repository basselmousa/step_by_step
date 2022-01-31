import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/controllers/users/users_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/image_constatns.dart';
import 'package:step_by_step/mvc/helpers/routes/app_routes.dart';
import 'package:step_by_step/mvc/utils/utils.dart';
import 'package:step_by_step/mvc/views/widgets/edit_text_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _idController = new TextEditingController();
  TextEditingController _passwordNameController = new TextEditingController();
  TextEditingController _confirmPasswordNameController =
      new TextEditingController();
bool trySignUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.COLOR_grey,
      body: Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.backGround),
                fit: BoxFit.cover),
           // Set border width
            // Set rounded corner radius
          ),
          padding: EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, // Set border color
                      width: 3.0),
                  borderRadius: BorderRadius.circular(25),
                  color: ColorConstants.COLOR_White,


                ),
                  padding: EdgeInsets.only(left: 10),
                  child: editTextWithCenterAlign(_idController, "ID Number"),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 3.0),
                    borderRadius: BorderRadius.circular(25),
                    color: ColorConstants.COLOR_White,


                  ),
                  padding: EdgeInsets.only(left: 10),
                  child:
                      editTextWithCenterAlign(_fullNameController, "Full Name"),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 3.0),
                    borderRadius: BorderRadius.circular(25),
                    color: ColorConstants.COLOR_White,


                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: editTextWithCenterAlign(
                      _passwordNameController, "Password",password: true),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 3.0),
                    borderRadius: BorderRadius.circular(25),
                    color: ColorConstants.COLOR_White,


                  ),
                  padding: EdgeInsets.only(left: 10),

                  child: editTextWithCenterAlign(
                      _confirmPasswordNameController, "Confirm Password",password: true),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                ),
                Container(

                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      if(validated()){
                      setState(() {
                        trySignUp = true;
                      });

                        UserController().signUp(
                            returnEmail(_idController.text),
                            _passwordNameController.text,
                            _fullNameController.text,

                            context).whenComplete(() => setState((){
                          trySignUp = false;
                        }));
                      }
                    },
                    child: trySignUp ? CircularProgressIndicator() : Text("Create Account"),
                    style: ElevatedButton.styleFrom(
                      primary:Colors.blue,
                      onPrimary: Colors.black45,
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
      ),
    );
  }

  bool validated(){

    if(_idController.text.isEmpty){
      buildSnackBar(context, "ID is required");
      return false;
    }
    else if(_fullNameController.text.isEmpty){
      buildSnackBar(context, "Full Name is required");
      return false;
    }
    else if(_passwordNameController.text.isEmpty){
      buildSnackBar(context, "Password is required");
      return false;
    }
    else if(_confirmPasswordNameController.text.isEmpty || _confirmPasswordNameController.text != _passwordNameController.text){
      buildSnackBar(context, "Password does not matched");
      return false;
    }

    return true;
  }
}
