import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/cart_counter.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(_w/40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Name',
          style: TextStyle(
              fontSize: _w/20,
          fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text('₹ discount price',style: TextStyle(color: Colors.orange, fontSize: _w/25,fontWeight: FontWeight.bold),),
            Text('₹ price',style: TextStyle(decoration: TextDecoration.lineThrough),),
            Spacer(),
            CartCounter()
          ],
        ),
          Text('About')
        ],
      ),
    );
  }
}
