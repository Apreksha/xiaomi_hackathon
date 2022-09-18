import 'package:flutter/material.dart';

class ShowOrderDetails extends StatefulWidget {
  final String customerName, customerEmail, customerPhone, orderNo;
  final List productName, productPrice;
  final int total;
  const ShowOrderDetails({Key? key, required this.productName, required this.productPrice, required this.customerName,
    required this.customerEmail, required this.customerPhone, required this.orderNo, required this.total}) : super(key: key);

  @override
  State<ShowOrderDetails> createState() => _ShowOrderDetailsState();
}

class _ShowOrderDetailsState extends State<ShowOrderDetails> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left:10, top: 10),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Text('Confirm order details', style: TextStyle(color: Colors.grey.shade700, fontSize: 18),),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black,),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('Order ID: ${widget.orderNo}', style: TextStyle( fontSize: 17),)),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.productName[0], style: TextStyle(color: Colors.black, fontSize: 15),),
                    Text('₹ ${widget.productPrice[0]}', style: TextStyle(color: Colors.black, fontSize: 15),),
                  ],
                ),
                SizedBox(height: 12,),
                showPriceDetails('Subtotal', widget.productPrice[0]),
                showPriceDetails('Delivery Charges', 0),
                showPriceDetails('Total', widget.productPrice[0]),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 10,),
                Text('Customer Details', style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
                SizedBox(height: 15,),
                Text('Name: ${widget.customerName}', style: TextStyle(color: Colors.black, fontSize: 17),),
                Text('Phone: ${widget.customerPhone}', style: TextStyle(color: Colors.black, fontSize: 17),),
                Text('Email: ${widget.customerEmail}', style: TextStyle(color: Colors.black, fontSize: 17),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column showPriceDetails(String heading, int price){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(heading, style: TextStyle(color: Colors.grey.shade600, fontSize: 17)),
            Text('₹ $price', style: TextStyle(color: Colors.grey.shade600, fontSize: 17))
          ],
        ),
        SizedBox(height: 12,)
      ],
    );
  }
}
