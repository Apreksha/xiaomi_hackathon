import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/cart_button.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/product_body.dart';

class ProductDetails extends StatelessWidget {
  String name;
  int discountprice;
  int price;
  Map<String,dynamic>imageMap;
  ProductDetails({required this.name,required this.discountprice,required this.price,required this.imageMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,//product.color

        bottomNavigationBar: CartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: ProductBody(name: name, discountprice: discountprice, price: price,imageMap: imageMap,)
    );
  }

}