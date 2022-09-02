import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/CartScreen/cart_body.dart';
import 'package:xiaomi_hackathon/constants.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int cost=0;
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartBody(),
      bottomNavigationBar: buildBottomNavigationBar(context)
    );
  }

  Container buildBottomNavigationBar(BuildContext context){
    var size=MediaQuery.of(context).size;
    return Container(
      height: 174,
      padding: EdgeInsets.symmetric(
          vertical: (15 / 375.0) * size.width,
          horizontal: (30 / 375.0) * size.width
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15)
          )]
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: (40 / 375.0) * size.width,
                  width: (40 / 375.0) * size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset("assets/icons/receipt.png"),
                ),
                /*Text('Add Voucher Code'),
                const SizedBox(width: 10,),
                Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor,)*/
              ],
            ),
            SizedBox(height: (20 / 375.0) * size.height,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: 'Total:\n',
                    children: [
                      TextSpan(
                          text: '₹ 25,999',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          )
                      )
                    ]
                )),
                SizedBox(
                  width: (190 / 375.0) * size.width,
                  child: ElevatedButton(
                    child: Text('Check Out'),
                    onPressed: (){},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      title: Column(
        children: [
          Text('Your Cart',
            style: TextStyle(
                color: Colors.black
            ),),
          Text('1 item',
            style: Theme.of(context).textTheme.caption,)
        ],
      ),
    );
  }
}
