import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding:EdgeInsets.only(left:_w/30,right: _w/30),
        child: Container(
          padding: EdgeInsets.only(left: _w/10,right: _w/10),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_w/20)),
            color: Colors.orange,
          ),
          height: _h/10,
          width: _w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.shopping_cart,weight: _w/20),
              Text('Add To Cart',
                style: TextStyle(fontSize: _w/20,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
