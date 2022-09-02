import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/Categories/categories_body.dart';
import 'package:xiaomi_hackathon/constants.dart';

class Categories_Main_Page extends StatelessWidget {
  const Categories_Main_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Categories_Body(),
    );
  }
  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: kTextColor,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.search),
          color: kTextColor,
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.shopping_cart),
          color: kTextColor,
        ),
        SizedBox(width: kDefaultPaddin/2)
      ],
    );
  }
}
