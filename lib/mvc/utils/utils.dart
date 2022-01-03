import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

moveScreen(context,page ,{replacement = true, data}){
  if(replacement)
  {
    Navigator.pushReplacementNamed(
        context, page, arguments: data);
  }else{
    Navigator.pushNamed(
        context, page, arguments: data);
  }
}
String returnEmail(String id){

  if(int.tryParse(id) != null){
    return id + '@std.wise.edu.jo';

  }
  return id+'@wise.edu.jo';
}

buildSnackBar(context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text), duration: Duration(milliseconds: 500),));
}
