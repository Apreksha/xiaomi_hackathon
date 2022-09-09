import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/PaymentSuccess/payment_success.dart';

class ChoosePayment extends StatefulWidget {
  const ChoosePayment({Key? key}) : super(key: key);

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.white,
          height: 50,
          margin: EdgeInsets.only(left:10, top: 10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Text('Choose a payment method', style: TextStyle(color: Colors.grey.shade700, fontSize: 18),),
        ),
        options('Credit / Debit Card','card',0),
        options('UPI', 'upi',1),
        options('PayTM Wallet', 'paytm',2),
        options('Cash', 'payOnDelivery',3),
      ],
    );
  }


  InkWell options(String option, String icon, int index){
    return InkWell(
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
        onTap: (){
          if(index==3)
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentSuccess()));
        }
    );

  }

}