import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/SignUp.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';

import '../ProductDescription/cart_counter.dart';

class CartItemCard extends StatefulWidget {
  List image;
  List productName;
  List quantity;
  List price;
  int index;

  CartItemCard({required this.image,required this.productName,required this.quantity,required this.price,required this.index});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (88 / 375.0) * width,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                //color: Colors.red,
                padding: EdgeInsets.all(7),
                child: Image.asset("assets/images/smartphone.png"),
              ),
            ),
          ),
          showNamePriceQty(size,widget.productName[widget.index],widget.price[widget.index],widget.quantity[widget.index]),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CartCounter(count: widget.quantity[widget.index],)
          )],
      ),
    );
  }

  Column showNamePriceQty(var size,String name,int price,int quantity){
    return Column(
      children: [
        Text(name,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black
          ),
          maxLines: 2,),
        const SizedBox(height: 10,),
        Text.rich(TextSpan(
            text: (quantity*price).toString(),
            style: TextStyle(
                color: kPrimaryColor
            ),
        ))
      ],
    );
  }
}
