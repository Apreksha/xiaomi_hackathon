import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/cart_button.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/product_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,//product.color

        bottomNavigationBar: CartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: ProductBody()
    );
  }

}