import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/product_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,//product.color
      appBar: buildAppBar(context),
      body: ProductBody()
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