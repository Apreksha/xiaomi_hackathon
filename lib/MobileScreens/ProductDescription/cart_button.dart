import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart.dart';
import 'package:xiaomi_hackathon/MobileScreens/productDB.dart';

class CartButton extends StatefulWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {


  @override
  Widget build(BuildContext context) {

    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
          child:  Container(
            padding: EdgeInsets.symmetric(horizontal: _w/30,vertical:_w/30),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(_w/20)),
              color: Colors.green,
            ),
            height: _h/10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.card_travel,weight: _w/30),
                Text('Buy Now',
                  style: TextStyle(fontSize: _w/30,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
        SizedBox(
          width: _w/10,
        ),
        GestureDetector(
          onTap: ()=>Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          ),
          child: Container(
             padding: EdgeInsets.symmetric(horizontal: _w/30,vertical:_w/30),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(_w/20)),
              color: Colors.orange,
            ),
            height: _h/10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shopping_cart,weight: _w/30),
                Text('Add To Cart',
                  style: TextStyle(fontSize: _w/30,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
