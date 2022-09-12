import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/PaymentSuccess/email.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  var totalAmount='\$24555.00';
  var totalItems=2;

  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Scaffold(
      body: Container(
        child: Column(
          children: [
            successBox(height, width),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showButton('Share', 'assets/icons/share.png'),
                SizedBox(width: 30,),
                showButton('Print', 'assets/icons/print.png')
              ],
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange)
              ),
              onPressed: (){},
              child: Text('Go To HomePage')
            )
          ],
        ),
      ),
    );
  }
  GestureDetector showButton(String buttonName, String icon){
    return GestureDetector(
      onTap: (){
        if(buttonName=='Share')
          Email().sendEmail();
      },
      child: Column(
        children: [
          Image.asset(icon, width: 40, height: 40,),
          SizedBox(height: 5,),
          Text(buttonName)
        ],
      ),
    );
  }

  Container successBox(var height, var width){
    return Container(
      height: height*0.55,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight:Radius.circular(30))
      ),
      width: width,
      child: Container(
        height: height*0.2,
        margin: EdgeInsets.fromLTRB(15, 60, 15, 15),
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/paymentSuccess.jpg', width: 120, height: 120,),
              Column(
                children: [
                  Text(
                    'SUCCESS!!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                  Text(
                    'Payment Successful for $totalItems items',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                ],
              ),
              Column(
                children: [
                  Text('Total Amount',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  SizedBox(height: 10,),
                  Text(
                    totalAmount.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
