import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:step_by_step/mvc/controllers/admins/admin_controller.dart';
import 'package:step_by_step/mvc/controllers/users/book_controller.dart';
import 'package:step_by_step/mvc/helpers/constants/colors_constants.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';
import 'package:step_by_step/mvc/models/book_model.dart';
import 'package:step_by_step/mvc/views/widgets/edit_text_widget.dart';

class LibraryAdmin extends StatefulWidget {
  const LibraryAdmin({Key? key}) : super(key: key);

  @override
  _LibraryAdminState createState() => _LibraryAdminState();
}

class _LibraryAdminState extends State<LibraryAdmin> {
  TextEditingController _rejectController = new TextEditingController();
  TextEditingController _bookNameController = new TextEditingController();
  TextEditingController _bookNumberController = new TextEditingController();
  TextEditingController _bookStatusController = new TextEditingController();
  TextEditingController _bookDescriptionController =
      new TextEditingController();
  late File _imageFile;

  final picker = ImagePicker();

  Future pickImageFromGallery() async {
    final pickedImage = await picker
        .getImage(source: ImageSource.gallery)
        .then((value) => setState(() {
              _imageFile = File(value.path);
              print(_imageFile.path);
            }))
        .catchError((onError) {
      print(onError.toString());
    });
  }

  Future pickImageFromCamera() async {
    final pickedImage = await picker
        .getImage(source: ImageSource.camera)
        .then((value) => setState(() {
              _imageFile = File(value.path);
              print(_imageFile
                  .toString()
                  .substring(_imageFile.toString().indexOf('P')));
            }))
        .catchError((onError) {
      print(onError.toString());
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("الغاء"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("تأكيد"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("رفض الطلب"),
      content: Container(
        height: 200,
        child: TextField(
          maxLines: 5,
          controller: _rejectController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              fillColor: Colors.grey[300],
              filled: true,
              hintText: "سبب الرفض",
              hintStyle: TextStyle(color: ColorConstants.COLOR_Black54),
              border: InputBorder.none),
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(indicatorColor: Colors.amberAccent, tabs: [
            Tab(
              child: Text(
                'طلبات اقتراض كتاب',
                style: TextStyle(
                    fontSize: FontConstants.TEXT_Font20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'اضافة كتاب',
                style: TextStyle(
                    fontSize: FontConstants.TEXT_Font20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
        body: TabBarView(children: [
          StreamBuilder<QuerySnapshot>(
            stream: null,
            builder: (context, snapshot) {
              return StreamBuilder<QuerySnapshot>(
                stream: AdminController().getReservations(),
                builder: (context, snapshot) {
                  print(snapshot.data!.size);
                  return snapshot.hasData ?
                  snapshot.data!.size == 0 ?  Center(child: Text("No Reservations Request"),):
                  ListView.builder(
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, index) {
                        return  SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.docs[index].data()['bookName'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontConstants.TEXT_Font20),
                                ),
                                Padding(padding: EdgeInsets.only(right: 8)),
                                Text(
                                  snapshot.data!.docs[index].data()['userName'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontConstants.TEXT_Font20),
                                ),
                                Text(
                                  snapshot.data!.docs[index].data()['userNumber'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontConstants.TEXT_Font20),
                                ),
                                Padding(padding: EdgeInsets.only(right: 15)),
                                ElevatedButton(
                                  onPressed: () {
                                    AdminController().reservedBook(snapshot.data!.docs[index].id,'success', context);
                                  },
                                  child: Text("قبول"),
                                  style: ElevatedButton.styleFrom(
                                    primary: ColorConstants.COLOR_White,
                                    onPrimary: ColorConstants.COLOR_Red,
                                    textStyle: TextStyle(
                                        color: ColorConstants.COLOR_Black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontConstants.TEXT_Font20),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 8)),
                                ElevatedButton(
                                  onPressed: () {
                                    AdminController().reservedBook(snapshot.data!.docs[index].id, 'declined', context);
                                  },
                                  child: Text("رفض"),
                                  style: ElevatedButton.styleFrom(
                                    primary: ColorConstants.COLOR_White,
                                    onPrimary: ColorConstants.COLOR_Red,
                                    textStyle: TextStyle(
                                        color: ColorConstants.COLOR_Black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontConstants.TEXT_Font20),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 8)),
                              ],
                            ),
                          ),
                        ) ;
                      }): Center(child: CircularProgressIndicator());
                }
              );
            }
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    editTextWithCenterAlign(_bookNameController, "اسم الكتاب "),
                    editTextWithCenterAlign(_bookNumberController, "رقم الكتاب "),
                    editTextWithCenterAlign(
                        _bookDescriptionController, "وصف الكتاب "),
                    editTextWithCenterAlign(
                        _bookStatusController, "حالة الكتاب "),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        ElevatedButton(
                            onPressed: () => pickImageFromGallery(),
                            child: Text("From Gallery")),
                        ElevatedButton(
                            onPressed: () => pickImageFromCamera(),
                            child: Text("Camera")),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () => AdminController().addBook(
                            Book(
                                name: _bookNameController.text,
                                bookNo: _bookNumberController.text,
                                description: _bookDescriptionController.text,
                                status: _bookStatusController.text),
                            _imageFile,
                            context),
                        child: Text("Add")),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
