import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/cart_counter.dart';
import 'package:xiaomi_hackathon/constants.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int qty=1;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (88 / 375.0) * size.width,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                //color: Colors.red,
                padding: EdgeInsets.all(7),
                child: Image.asset("assets/images/smartphone.png"),
              ),
            ),
          ),
          showNamePriceQty(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CartCounter()
          )],
      ),
    );
  }

  Column showNamePriceQty(){
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
            text: "₹25,999",
            style: TextStyle(
                color: kPrimaryColor
            ),
        ))
      ],
    );
  }
}
