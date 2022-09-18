import 'package:flutter/material.dart';
import 'aboutProduct.dart';
import 'cart_counter.dart';

class ProductInfo extends StatelessWidget {
  final String name;
  final int discountprice;
  final int price, categoryIndex;
  ProductInfo({required this.name,required this.discountprice,required this.price, required this.categoryIndex});

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
              CartCounter()
            ],
          ),
          (categoryIndex == 7) ? AboutProducts() : Container()
        ],
      ),
    );
  }
}
