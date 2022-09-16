import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/aboutProduct.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/cart_counter.dart';

class ProductInfo extends StatelessWidget {
  String name;
  int discountprice;
  int price;
  ProductInfo({required this.name,required this.discountprice,required this.price});
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(_w/40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(name,
          style: TextStyle(
              fontSize: _w/20,
          fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text('₹ $discountprice',style: TextStyle(color: Colors.orange, fontSize: _w/20,fontWeight: FontWeight.bold),),
            SizedBox(width: 5,),
            Text('₹ $price',style: TextStyle(decoration: TextDecoration.lineThrough),),
            Spacer(),
            CartCounter(count: 1,)
          ],
        ),
          AboutProducts()
        ],
      ),
    );
  }
}
