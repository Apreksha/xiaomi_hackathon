import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_item_card.dart';

class CartBody extends StatefulWidget {
  final List productNameArray, productPriceArray, imageArray;
  const CartBody({Key? key, required this.productNameArray, required this.productPriceArray, required this.imageArray}) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    var height=MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: height*0.75,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: (10 / 375.0) * size.width),
        child: ListView.builder(
            itemCount: widget.productPriceArray.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: (5 / 375.0) * size.height),
              child: CartItemCard(productName: widget.productNameArray[index],
                  productPrice: widget.productPriceArray[index], image: widget.imageArray[index]),
            )
        ),
      ),
    );
  }
}