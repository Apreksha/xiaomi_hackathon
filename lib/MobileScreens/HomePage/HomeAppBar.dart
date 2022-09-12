import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(Icons.sort,
            size: 30,
            color: Colors.orange,),
          Padding(padding: EdgeInsets.only(left:20 ),
            child: Text('DP Shop',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange
              ),),),
          Spacer(),
          Badge(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text('3',
              style: TextStyle(
                  color: Colors.white
              ),),
            child: InkWell(
              onTap: (){},
              child: Icon(Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.orange,),
            ),
          )
        ],
      ),
    );
  }
}
