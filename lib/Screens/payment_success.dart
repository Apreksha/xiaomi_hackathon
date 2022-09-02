import 'package:flutter/material.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
            height: 110,
            width: 110,
            child: Image.asset("assets/tick.png"),
          ),
            Text("Receipt will be sent to you on your registered E-Mail ID or Whatsapp Number.\n"
                "Physical copy can be printed at the counter if required.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,

              ),
            ),
          ]
          ),
        ),
      ),
    );
  }
}
