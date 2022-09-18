import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/Checkout/shippingAddress.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/Checkout/showOrderDetails.dart';
import '../appBar.dart';
import 'choosePayment.dart';

class Checkout extends StatefulWidget {
  final String custName, custEmail, custPhone, custAdd, custCity, custState, custPincode, choice, orderNo;
  final int total;
  final List prodName;
  final List prodPrice;
  const Checkout({Key? key, required this.choice, required this.custName, required this.custEmail, required this.custPhone,
    required this.custAdd, required this.custCity, required this.custState, required this.custPincode, required this.orderNo, required this.total, required this.prodName, required this.prodPrice}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with SingleTickerProviderStateMixin{
  late TabController _tabController;

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

    return Scaffold(
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
                  indicator: const BoxDecoration(
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
                  ShowOrderDetails(productName: widget.prodName, productPrice: widget.prodPrice, customerName: widget.custName,
                      customerEmail: widget.custEmail, customerPhone: widget.custPhone, orderNo: widget.orderNo, total: widget.total),
                  ShippingAddress(address: widget.custAdd, city: widget.custCity, state: widget.custState, pincode: widget.custPincode,),
                  ChoosePayment(choice: widget.choice, total: widget.total, custName: widget.custName, custPhone: widget.custPhone,
                    custEmail: widget.custEmail, orderNo: widget.orderNo,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tabBarHeadings(String iconPath, String heading){
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 20, width: 20,),
          Text(heading, style: const TextStyle(
              color: Colors.black
          ),),
        ],
      ),
    );
  }

}