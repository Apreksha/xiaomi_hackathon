import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart_item_card.dart';

class CartBody extends StatefulWidget {
  List image;
  List productName;
  List quantity;
  List price;

  CartBody({required this.image,required this.productName,required this.quantity,required this.price});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

        return SingleChildScrollView(
          child: Container(
            height: height*0.8,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: (10 / 375.0) * size.width),
            child: ListView.builder(
                itemCount: widget.image.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: (5 / 375.0) * size.height),
                  child: Dismissible(
                      key: Key('1'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: (10 / 375.0) * size.width),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Image.asset("assets/icons/trash.png"),
                      ),
                      onDismissed: (direction){
                        setState(() {
                          //remove item from cart
                        });
                      },
                      child: CartItemCard(image: widget.image, productName: widget.productName, quantity: widget.quantity, price: widget.price, index: index)),
                )
            ),
          ),
        );
  }


}