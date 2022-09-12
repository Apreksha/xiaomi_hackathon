import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart.dart';
import 'package:xiaomi_hackathon/MobileScreens/Profile.dart';
import 'CategoriesWidget.dart';
import 'HomeAppBar.dart';
import 'ItemsWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int homeIndex=0;
  @override
  Widget build(BuildContext context) {

    double _h =MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: CurvedNavigationBar(
        height: _h/15,
        color: Colors.orange,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(homeIndex == 0?Icons.home_outlined:Icons.home, size: 30),
          Icon(homeIndex == 1? Icons.person_2_outlined:Icons.person, size: 30),
          Icon(Icons.logout, size: 30),
        ],
        onTap: (index){
          setState(() {
            print(index);
            homeIndex=index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
      ),

      body: homeIndex == 1?const Profile():ListView(
        children: [
          HomeAppBar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)
                )
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: _h/16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      width: 290,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here....",
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.document_scanner_outlined,
                      size: _w/18,
                      color: Colors.orange,),

                  ],),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: _h/30,
                    horizontal: _w/23,
                  ),
                  child: Text("Categories",
                    style: TextStyle(
                        fontSize: _w/16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange
                    ),),
                ),
                SizedBox(
                    height: 50,
                    child: CategoriesWidget()),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: _h/30,horizontal: _w/23),
                  child: Text("Best Selling",
                    style: TextStyle(
                        fontSize: _w/16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange
                    ),),
                ),

                SizedBox(
                  height: _h,
                  child: ItemsWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
