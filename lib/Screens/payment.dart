import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: Text('Pay', style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Amount', style: TextStyle(color: Colors.black)),
                      SizedBox(width: 5,),
                      Text('₹14,999', style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Text('Details', style: TextStyle(color: Colors.orange)),
                        Icon(Icons.keyboard_arrow_down, color: Colors.orange,),
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        isVisible = !isVisible;});

                    },
                  )
                ],
              ),
            ),
        details(isVisible),
            Container(
              //color: Colors.white,
              height: 50,
              margin: EdgeInsets.only(left:10, top: 10),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Text('Choose a payment method', style: TextStyle(color: Colors.grey.shade700, fontSize: 18),),
            ),
            options('Credit / Debit Card','card'),
            options('UPI', 'upi'),
            options('PayTM Wallet', 'paytm'),
            options('Cash On Delivery', 'payOnDelivery'),
          ],
        ),
      ),
    );
  }

  GestureDetector options(String option, String icon){
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
          ),
          height: 70,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/icons/$icon.png', height: 50, width: 50,),
              Text(option, style: TextStyle(fontSize: 18),),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
            ],
          )
      ),
      onTap: (){}
    );

  }

  Visibility details(bool isVisible){
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ID:', style: TextStyle(color: Colors.grey.shade600, fontSize: 17),),
                Text('5888888888888', style: TextStyle(color: Colors.black, fontSize: 17))
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Redmi Note S5', style: TextStyle(color: Colors.black, fontSize: 19),),
                SizedBox(width: 5,),
                Text('X', style: TextStyle(color: Colors.grey.shade600, fontSize: 17)),
                Text('1', style: TextStyle(color: Colors.grey.shade600, fontSize: 17))
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SUBTOTAL', style: TextStyle(color: Colors.grey.shade600, fontSize: 17)),
                Text('₹14,999', style: TextStyle(color: Colors.grey.shade600, fontSize: 17))
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('DELIVERY', style: TextStyle(color: Colors.grey.shade600, fontSize: 17)),
                Text('₹0', style: TextStyle(color: Colors.grey.shade600, fontSize: 17))
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TOTAL', style: TextStyle(color: Colors.grey.shade600, fontSize: 17)),
                Text('₹14,999', style: TextStyle(color: Colors.orange, fontSize: 17),)
              ],
            ),
            SizedBox(height: 10,),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(height: 10,),
            Text('Delivery to', style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
            SizedBox(height: 15,),
            Row(
              children: [
                Text('Apreksha Mathur', style: TextStyle(color: Colors.black, fontSize: 17),),
                SizedBox(width: 10,),
                Text('+91 8233474646', style: TextStyle(color: Colors.black, fontSize: 17),)
              ],
            ),
            SizedBox(height: 15,),
            Text('89, Income Tax Colony 1st, jagatpura road, malviya nagar', style: TextStyle(color: Colors.black, fontSize: 15),),
            SizedBox(height: 5,),
            Row(
              children: [
                Text('JAIPUR', style: TextStyle(color: Colors.black, fontSize: 15),),
                SizedBox(width: 5,),
                Text('302017', style: TextStyle(color: Colors.black, fontSize: 15),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
