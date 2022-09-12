import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/trackingOrder.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/color_dot.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
import 'package:im_stepper/stepper.dart';

class OrderHistoryDetails extends StatefulWidget {
  const OrderHistoryDetails({Key? key}) : super(key: key);

  @override
  State<OrderHistoryDetails> createState() => _OrderHistoryDetailsState();
}

class _OrderHistoryDetailsState extends State<OrderHistoryDetails> {
  @override
  Widget build(BuildContext context) {
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
              Container(
                height: 500,
                width: 100,
                child: IconStepper(
                  scrollingDisabled: false,
                  steppingEnabled: false,
                  direction: Axis.vertical,
                  icons: [
                    Icon(
                      Icons.radio_button_checked,
                      color: Colors.green,
                    ),
                    Icon(Icons.check),
                    Icon(Icons.check),
                    Icon(Icons.check),
                    Icon(Icons.check),
                  ],
                ),
              ),
              //TrackingOrder(),
              //tracking for order confirmed and delivered
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
                  ColorDot(color: Colors.blue),
                  SizedBox(height: 5,),
                  Text('₹25,999')
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
