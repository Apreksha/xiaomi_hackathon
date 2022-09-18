import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/OrderHistory/trackingOrder.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("Operators").doc(firebaseUser!.uid).get().then((value){
      setState(() {
        customerName = value.data()!["custName"][widget.index];
        customerAddress = value.data()!["custAdd"][widget.index];
        customerCity = value.data()!["custCity"][widget.index];
        customerState = value.data()!["custState"][widget.index];
        customerPincode = value.data()!["custPincode"][widget.index];
        customerEmail = value.data()!["custEmail"][widget.index];
        customerPhone = value.data()!["custPhone"][widget.index];
        orderNo = value.data()!["orderNo"][widget.index];
        paymentMode = value.data()!["paymentMode"][widget.index];
        choiceOfBusinessCommunication = value.data()!["choice"][widget.index];
        productName = value.data()!["prodName"][widget.index];
        productPrice = value.data()!["prodPrice"][widget.index];
        image = value.data()!["prodImage"][widget.index];

        if(value.data()!["custName"]!= null || value.data()!["custEmail"]!= null || value.data()!["custPhone"]!= null ||
            value.data()!["custAdd"]!= null || value.data()!["custCity"]!= null || value.data()!["custState"]!= null ||
            value.data()!["custPincode"]!= null || value.data()!["orderNo"]!= null || value.data()!["paymentMode"]!= null ||
            value.data()!["choice"]!= null || value.data()!["prodImage"]!= null || value.data()!["prodPrice"]!= null ||
            value.data()!["prodName"]!= null){
          loading = false;
        }
      });
    });
  }
}
