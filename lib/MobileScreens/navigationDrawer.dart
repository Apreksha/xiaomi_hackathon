import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/LoginScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/order_history.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/operatorPhoto.png', width: 100, height: 100, fit: BoxFit.cover,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mi ID ', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                    Text('02012001', style: TextStyle(
                        fontSize: 18
                    ),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/miToken.png', width: 30, height: 30,),
                    Text('0 Tokens')
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset('assets/icons/categories.png', width: 30, height: 30,),
            title: Text('Categories'),
            onTap: (){
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Image.asset('assets/icons/orderHistory.png', width: 30, height: 30,),
            title: Text('Order History'),
            onTap: (){
              Navigator.pop(context);
              Navigator.of(context).pushNamed('orderHistory');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: (){
              Navigator.pop(context);
              Navigator.of(context).pushNamed('colorDot');
            },
          ),

        ],
      ),
    );
  }
}
