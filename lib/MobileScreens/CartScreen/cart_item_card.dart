import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';

import '../ProductDescription/cart_counter.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int qty=1, price = 25999;

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
          showNamePriceQty(size),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CartCounter()
          )],
      ),
    );
  }

  Column showNamePriceQty(var size){
    return Column(
      children: [
        Text('Redmi Note 11',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black
          ),
          maxLines: 2,),
        const SizedBox(height: 10,),
        Text.rich(TextSpan(
            text: (price*qty).toString(),
            style: TextStyle(
                color: kPrimaryColor
            ),
        ))
      ],
    );
  }
}
