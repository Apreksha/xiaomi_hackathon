import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/categories_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/products_details.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';
import 'package:xiaomi_hackathon/MobileScreens/productDB.dart';

class CategoriesMainPage extends StatefulWidget {
  int categoryIndex;
  String title;

  CategoriesMainPage({required this.categoryIndex,required this.title});

  @override
  State<CategoriesMainPage> createState() => _CategoriesMainPageState();
}

class _CategoriesMainPageState extends State<CategoriesMainPage> {
  late List allproducts;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productDB().productDetails().then((value) =>allproducts = value),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Scaffold(
            appBar: buildAppBar(context, widget.title),
            body: Categories_Body(allproducts: allproducts, CategoryIndex: widget.categoryIndex),
          );
        }else{
          return Scaffold(
              backgroundColor: Colors.grey.shade200,
              body: Center(child: CircularProgressIndicator()));
        }
      },

    );
  }
}
