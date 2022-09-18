import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:xiaomi_hackathon/OfflineMode/MobileScreens/FormUI.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/LoginScreen.dart';
import '../ProductDescription/products_details.dart';
import '../Profile/Profile_main.dart';
import '../SearchBar.dart';
import '../productDB.dart';
import 'CategoriesWidget.dart';
import 'HomeAppBar.dart';
import 'ItemsWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int homeIndex=0;
  late List allproducts;
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool offline = false;
  bool isAlertSet = false;
  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    // TODO: implement initState
    getConnectivity();
    super.initState();
  }
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );


  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double _h =MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;

    void _scan(){
      setState(() { FlutterBarcodeScanner.scanBarcode(
          '#000000', "Cancel", true, ScanMode.BARCODE).then((value){
            print(value);
            if(value!='-1') {
              Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetails(categoryIndex: 7,name: allproducts[7]['name'][1], discountprice: allproducts[7]['discountPrice'][1], price: allproducts[7]['price'][1], imageMap: allproducts[7]['images'][1])),
      );
            }});
      });
    }

    return FutureBuilder(
        future: productDB().productDetails().then((value) =>allproducts = value),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Scaffold(
              backgroundColor: Colors.white,

              bottomNavigationBar: CurvedNavigationBar(
                height: _h/15,
                color: Colors.orange,
                backgroundColor: Colors.grey.shade200,
                items: <Widget>[
                  Icon(homeIndex == 0?Icons.home_outlined:Icons.home, size: 30),
                  Icon(homeIndex == 1? Icons.person_2_outlined:Icons.person, size: 30),
                  GestureDetector(
                      onTap: showLogoutBox,
                      child: const Icon(Icons.logout, size: 30)),
                ],
                onTap: (index){
                  setState(() {
                    homeIndex=index;
                  });
                },
                animationCurve: Curves.fastLinearToSlowEaseIn,
              ),

              body: homeIndex == 1 ? const ProfileMain():ListView(
                children: [
                  const HomeAppBar(),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)
                        )
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: _h/16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            InkWell(
                              onTap: ()=>showSearch(context: context, delegate: DataSearch(alldata: allproducts)),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.7,
                                margin: const EdgeInsets.only(left: 5),
                                alignment: Alignment.center,
                                child: Text('Search here....'),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: ()=>_scan(),
                              child: Icon(Icons.document_scanner_outlined,
                                size: _w/18,
                                color: Colors.orange,),
                            ),

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
                        const SizedBox(
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
                            child: const ItemsWidget())
                      ],
                    ),
                  ),
                ],
              ),
            );
          }else{
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        });
  }
  showLogoutBox()=> showCupertinoDialog<String>(
  context: context,
  builder: (BuildContext context) => CupertinoAlertDialog(
  title: const Text('Alert'),
  content: const Text('Do you want to Logout?'),
  actions: <Widget>[
  TextButton(onPressed: ()async{
    await FirebaseAuth.instance.signOut().then((value) {
      _myBox.put('loggedIn', false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyCustomLoginUI()));
    } );
  }, child: const Text('Yes')),
  TextButton(
  onPressed: () async {
  Navigator.pop(context, 'Cancel');
  },
child: const Text('No'),
),
],
),
);
  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Do you want to go Offline Mode?'),
      actions: <Widget>[
        TextButton(onPressed: (){
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const FormUI(),
            ),
          );
        }, child: const Text('Yes')),
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
          child: const Text('No'),
        ),
      ],
    ),
  );
}
