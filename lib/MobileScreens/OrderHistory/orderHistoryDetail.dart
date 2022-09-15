import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/trackingOrder.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';


class OrderHistoryDetails extends StatefulWidget {
  final int index;
  const OrderHistoryDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<OrderHistoryDetails> createState() => _OrderHistoryDetailsState();
}

class _OrderHistoryDetailsState extends State<OrderHistoryDetails> {
  String productName="", productPrice="", customerName="", customerAddress="", customerPhone="", orderNo="", customerEmail="";
  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("Operators").doc('02012001'/*firebaseUser!.uid*/).get().then((value){
      setState(() {
        productName = value.data()!["Product Name"][widget.index];
        productPrice = value.data()!["Product Price"][widget.index];
        customerName = value.data()!["Customer Name"][widget.index];
        customerAddress = value.data()!["Customer Address"][widget.index];
        customerEmail = value.data()!["Customer Email"][widget.index];
        customerPhone = value.data()!["Customer Phone"][widget.index];
        orderNo = value.data()!["Order No"][widget.index];

      });
    });

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(context, 'Order Details'),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              itemCardDetails('Service Order Number: ', orderNo),
              SizedBox(height: 5,),
              itemCardDetails('Invoice Number: ', '876464654867867'),
              Divider(),
              orderDetails(),
              TrackingOrder(),
              shippingDetails(),
              priceDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Column orderDetails(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(productName),
                  SizedBox(height: 5,),
                  Text(productPrice),
                  //ColorDot(color: Colors.blue),
                ],
              ),
              Image.asset('assets/images/smartphone.png', width: 100,height: 100,)
            ],
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  Column priceDetails(){
    return Column(
      children: [
        Container(
          height: 170,
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text('Price Details', style: TextStyle(color: Colors.grey),)),
              Divider(),
              showPriceDetails('Subtotal', productPrice),
              showPriceDetails('Delivery Charges', '₹0'),
              showPriceDetails('Total', productPrice),
            ],
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  Column shippingDetails(){
    return Column(
      children: [
        Container(
          height: 200,
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text('Shipping Details', style: TextStyle(color: Colors.grey),)),
              Divider(),
              Text('Customer Name: $customerName', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Customer Address: $customerAddress'),
              Text('Customer Email: $customerEmail'),
              Text('Phone Number: $customerPhone')
            ],
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  Column showPriceDetails(String heading, String price){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(heading, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            Text(price, style: TextStyle(fontSize: 17))
          ],
        ),
        SizedBox(height: 12,)
      ],
    );
  }

  Row itemCardDetails(String headingText, String contentText){
    return Row(
      children: [
        heading(headingText),
        content(contentText),
      ],
    );
  }

  Text heading(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Text content(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
}
