import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/trackingOrder.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';


class OrderHistoryDetails extends StatefulWidget {
  const OrderHistoryDetails({Key? key}) : super(key: key);

  @override
  State<OrderHistoryDetails> createState() => _OrderHistoryDetailsState();
}

class _OrderHistoryDetailsState extends State<OrderHistoryDetails> {

  @override
  Widget build(BuildContext context) {
    /*final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("Users").doc('02012001'/*firebaseUser!.uid*/).get().then((value){
      setState(() {
        fav = value.data()!["dbms_Fav"];});
      favs = (value.data()!["dbms_Fav"].isEmpty) ? false : true;
      if(value.data()!["dbms_Fav"]!=null){
        loading = false;}
    });*/

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(context, 'Order Details'),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              itemCardDetails('Service Order Number: ', '876464654867867'),
              SizedBox(height: 5,),
              itemCardDetails('Invoice Number: ', '876464654867867'),
              Divider(),
              orderDetails(),
              TrackingOrder(),
              shippingDetails(),
              priceDetails(),
              Container(
                height: 80,
                padding: EdgeInsets.all(10),
                width: width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Payment Method', style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    Text('Cash')
                  ],
                ),
              )
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
                  Text('Redmi Note 5'),
                  SizedBox(height: 5,),
                  Text('₹25,999'),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: Colors.blue,
                    ),
                  ),
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
              showPriceDetails('Subtotal', '₹14,999'),
              showPriceDetails('Delivery Charges', '₹0'),
              showPriceDetails('Total', '₹14,999'),
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
              Text('Customer Name: Rohini Shrivastava', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Customer Address : C-25, Hari Ram Colony, Queens Road, Mahaveer Nagar\nJaipur\nRajasthan, 302089'),
              Text('Phone Number: 9758457896')
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
