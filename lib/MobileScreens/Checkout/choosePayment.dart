import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:xiaomi_hackathon/MobileScreens/razor_credentials.dart' as razorCredentials;
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/PaymentSuccess/payment_success.dart';

class ChoosePayment extends StatefulWidget {
  final String choice;
  const ChoosePayment({Key? key, required this.choice}) : super(key: key);

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);

    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentSuccess(choice: widget.choice)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    // Do something when payment fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment Failed'),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

// create order
  void createOrder(var amount) async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": amount,
      "currency": "INR",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    }
    print(res.body);
  }

  openGateway(String orderId) {
    var options = {
      'key': razorCredentials.keyId,
      //'amount': 200, //in the smallest currency sub-unit.
      'name': 'Mi Store',
      'order_id': orderId, // Generate order_id using Orders API
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '8233474646',
        'email': 'ary@example.com',
      }
    };
    _razorpay.open(options);
  }

  verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "razorpay_signature_verify.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment Failed'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }

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
        options('Online Payment','card',0),
        options('Cash', 'payOnDelivery',1),
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
          if(index==0) {
            createOrder(1499900);
            final firestoreInstance = FirebaseFirestore.instance;
            firestoreInstance.collection("Operators").doc('02012001').get().then((
                value) {
              firestoreInstance.collection("Operators")
                  .doc('02012001'/*firebaseUser.uid*/)
                  .update({
                "Mode Of Payment": FieldValue.arrayUnion(['Online Payment']),
              });
            });

          }
          if(index==1) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentSuccess(choice: widget.choice)));
            final firestoreInstance = FirebaseFirestore.instance;
            firestoreInstance.collection("Operators").doc('02012001').get().then((
                value) {
              firestoreInstance.collection("Operators")
                  .doc('02012001'/*firebaseUser.uid*/)
                  .update({
                "Mode Of Payment": FieldValue.arrayUnion(['Cash']),
              });
            });
          }
        }
    );
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
