import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/choosePayment.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/shippingAddress.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/showOrderDetails.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

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
      body:Center(
        child: Column(
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
                    Tab(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/order.png', height: 20, width: 20,),
                        Text('Order Details', style: TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),),
                    Tab(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/shipping.png', height: 20, width: 20,),
                        Text('Shipping', style: TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),),
                    Tab(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/payment.png', height: 20, width: 20,),
                        Text('Payment', style: TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ShowOrderDetails(),
                  ShippingAddress(),
                  ChoosePayment()
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
