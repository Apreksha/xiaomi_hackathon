import 'package:flutter/material.dart';

buildAppBar(BuildContext context, String heading){
  return AppBar(
    backgroundColor: Colors.orange,
    elevation: 0,
    leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: (){
      Navigator.of(context).pop();
    },),
    title: Text(heading,
      style: TextStyle(
          color: Colors.black
      ),
    ),
  );
}