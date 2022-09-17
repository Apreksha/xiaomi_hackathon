import 'package:flutter/material.dart';
import '../ProductDescription/cart_counter.dart';
import '../constants.dart';

class CartItemCard extends StatefulWidget {
  final String productName, image;
  final int productPrice;
  const CartItemCard({Key? key, required this.productName, required this.productPrice, required this.image}) : super(key: key);

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
      margin: EdgeInsets.only(left: 10, right: 10),
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
                padding: EdgeInsets.all(7),
                child: FadeInImage(
                    height: 100,
                    width: 100,
                    placeholder: AssetImage('assets/images/smartphone.png'),
                    image: NetworkImage(widget.image)),
              ),
            ),
          ),
          showNamePriceQty(size, widget.productName ,widget.productPrice),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: CartCounter()
          )],
      ),
    );
  }

  Widget showNamePriceQty(var size, String name, int price){
    return Container(
      width: size.width*0.3,
      child: Column(
        children: [
          Text(name,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black
            ),
            maxLines: 2,),
          const SizedBox(height: 10,),
          Text.rich(TextSpan(
            text: price.toString(),
            style: TextStyle(
                color: kPrimaryColor
            ),
          ))
        ],
      ),
    );
  }
}
