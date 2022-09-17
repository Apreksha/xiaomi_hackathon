import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/OrderHistory/trackingOrder.dart';

import '../appBar.dart';
import '../loadingScreen.dart';


class OrderHistoryDetails extends StatefulWidget {
  final int index;
  const OrderHistoryDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<OrderHistoryDetails> createState() => _OrderHistoryDetailsState();
}

class _OrderHistoryDetailsState extends State<OrderHistoryDetails> {
  String productName="", customerName="", customerAddress="", customerPhone="", orderNo="", customerEmail="",
      paymentMode="", choiceOfBusinessCommunication="", customerCity="", customerState="", customerPincode="", image="";
  int productPrice=0;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    getInformation();
    var width = MediaQuery.of(context).size.width;

    return loading==false ? Scaffold(
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
              choices(width, 'Payment Mode', paymentMode),
              choices(width, 'Choice of Business Communication', choiceOfBusinessCommunication),
            ],
          ),
        ),
      ),
    ) : LoadingScreen();
  }

  Widget choices(var width, String heading, String value){
    return Column(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.all(10),
          width: width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(heading, style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              Text(value)
            ],
          ),
        ),
        SizedBox(height: 10,),
      ],
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
                  Text('₹ ${productPrice}'),
                  //ColorDot(color: Colors.blue),
                ],
              ),
              FadeInImage(
                  height: 100,
                  width: 100,
                  placeholder: AssetImage('assets/images/smartphone.png'),
                  image: NetworkImage(image))
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
              showPriceDetails('Subtotal', '₹ ${productPrice}'),
              showPriceDetails('Delivery Charges', '₹0'),
              showPriceDetails('Total', '₹ ${productPrice}'),
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

  getInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("Operators").doc('02012001'/*firebaseUser!.uid*/).get().then((value){
      setState(() {
        customerName = value.data()!["Customer Name"][widget.index];
        customerAddress = value.data()!["Customer Address"][widget.index];
        customerCity = value.data()!["Customer City"][widget.index];
        customerState = value.data()!["Customer State"][widget.index];
        customerPincode = value.data()!["Customer Pincode"][widget.index];
        customerEmail = value.data()!["Customer Email"][widget.index];
        customerPhone = value.data()!["Customer Phone"][widget.index];
        orderNo = value.data()!["Order No"][widget.index];
        paymentMode = value.data()!["Payment Mode"][widget.index];
        choiceOfBusinessCommunication = value.data()!["Choice"][widget.index];
        productName = value.data()!["Product Name"][widget.index];
        productPrice = value.data()!["Product Price"][widget.index];
        image = value.data()!["Product Image"][widget.index];

        if(value.data()!["Customer Name"]!= null || value.data()!["Customer Email"]!= null || value.data()!["Customer Phone"]!= null ||
            value.data()!["Customer Address"]!= null || value.data()!["Customer City"]!= null || value.data()!["Customer State"]!= null ||
            value.data()!["Customer Pincode"]!= null || value.data()!["Order No"]!= null || value.data()!["Payment Mode"]!= null ||
            value.data()!["Choice"]!= null || value.data()!["Product Image"]!= null || value.data()!["Product Price"]!= null ||
            value.data()!["Product Name"]!= null){
          loading = false;
        }
      });
    });
  }
}
