import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/categories_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';
import 'package:xiaomi_hackathon/MobileScreens/navigationDrawer.dart';

class CategoriesMainPage extends StatelessWidget {
  const CategoriesMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Categories'),
      drawer: NavigationDrawer(),
      body: Categories_Body(),
    );
  }
}
