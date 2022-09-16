import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/choosePayment.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/shippingAddress.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/showOrderDetails.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
import 'package:xiaomi_hackathon/MobileScreens/loadingScreen.dart';

class Checkout extends StatefulWidget {
  final String choice;
  final int index;
  const Checkout({Key? key, required this.choice, required this.index}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  bool loading = true;
  String customerName="", customerPhone="", customerEmail="", orderNo="", productName="", productPrice="", customerAddress="",
      customerCity="", customerState="", customerPincode="";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getCustomerInformation();
    return loading==false ? Scaffold(
      appBar: buildAppBar(context, 'Checkout'),
      body:Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                height: 60,
                color: Colors.grey.shade200,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.orange,
                  ),
                  controller: _tabController,
                  isScrollable: true,
                  tabs: [
                    tabBarHeadings('assets/icons/order.png', 'Order Details'),
                    tabBarHeadings('assets/icons/shipping.png', 'Shipping'),
                    tabBarHeadings('assets/icons/payment.png', 'Payment'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ShowOrderDetails(productName: productName, productPrice: productPrice, customerName: customerName,
                    customerEmail: customerEmail, customerPhone: customerPhone, orderNo: orderNo,),
                  ShippingAddress(address: customerAddress, city: customerCity, state: customerState, pincode: customerPincode,),
                  ChoosePayment(choice: widget.choice, index: widget.index)
                ],
              ),
            )
          ],
        ),
      ),
    ) : LoadingScreen();
  }

  Widget tabBarHeadings(String iconPath, String heading){
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 20, width: 20,),
          Text(heading, style: TextStyle(
              color: Colors.black
          ),),
        ],
      ),
    );
  }

  getCustomerInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("Operators").doc('02012001'/*firebaseUser!.uid*/).get().then((value){
      setState(() {
        customerName = value.data()!["Customer Name"][widget.index];
        customerEmail = value.data()!["Customer Email"][widget.index];
        customerPhone = value.data()!["Customer Phone"][widget.index];
        orderNo = value.data()!["Order No"][widget.index];
        productName = value.data()!["Product Name"][widget.index];
        productPrice = value.data()!["Product Price"][widget.index];
        customerAddress = value.data()!["Customer Address"][widget.index];
        customerCity = value.data()!["Customer City"][widget.index];
        customerState = value.data()!["Customer State"][widget.index];
        customerPincode = value.data()!["Customer Pincode"][widget.index];

        if(value.data()!["Customer Name"]!= null || value.data()!["Customer Email"]!= null || value.data()!["Customer Phone"]!= null ||
            value.data()!["Customer Address"]!= null || value.data()!["Customer City"]!= null || value.data()!["Customer State"]!= null ||
            value.data()!["Customer Pincode"]!= null || value.data()!["Order No"]!= null || value.data()!["Product Name"]!= null ||
            value.data()!["Product Price"]!= null){
          loading = false;
        }
      });
    });
  }
}