import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart.dart';
class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left:_w/20 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Xiaomi Shop',
                  style: TextStyle(
                      fontSize: _w/15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                  ),),
                Text('Innovation for everyone',
                style: TextStyle(fontSize: _w/30,color: Colors.grey))
              ],
            ),),
          Spacer(),
          Badge(
            badgeColor: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.all(7),
            badgeContent: Text('3',
              style: TextStyle(
                  color: Colors.white
              ),),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
              child: Icon(Icons.shopping_cart,
                size: _w/12,
                color: Colors.orange,),
            ),
          )
        ],
      ),
    );
  }
}
