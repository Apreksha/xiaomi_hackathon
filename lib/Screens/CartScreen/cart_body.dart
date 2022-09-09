import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/CartScreen/cart_item_card.dart';
import 'package:xiaomi_hackathon/constants.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: (10 / 375.0) * size.width),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key('1'),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
            child: CartItemCard()),
        )
      ),
    );
  }
}
