import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/PaymentSuccess/whatsapp.dart';
import '../HomePage/HomeScreen.dart';
import '../loadingScreen.dart';
import 'email.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentSuccess extends StatefulWidget {
  final String choice, custName, custPhone, custEmail, orderNo;
  final int total;
  const PaymentSuccess({Key? key, required this.choice, required this.total, required this.custName, required this.custPhone, required this.custEmail, required this.orderNo}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  bool loading = true;
  List cartProductImage=[], productImageArray=[], productNameArray=[], productPriceArray=[];

  @override
  void init(){
    widget.choice == 'Email' ? Email().sendEmail(widget.orderNo, widget.custName, widget.custEmail, widget.total)
        : Whatsapp().sendMessage(widget.custPhone, widget.custName, widget.orderNo, widget.total);
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    getProductInformation();
    getCustomerInformation();

    return loading==false ? Scaffold(
      body: Container(
        child: Column(
          children: [
            successBox(height, width),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showButton('Share', 'assets/icons/share.png'),
                SizedBox(width: 20,),
                showButton('Print', 'assets/icons/print.png'),
              ],
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)
                ),
                onPressed: (){
                  deleteCart();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Go To HomePage')
            )
          ],
        ),
      ),
    ) : LoadingScreen();
  }
  GestureDetector showButton(String buttonName, String icon){
    return GestureDetector(
      onTap: (){
        if(buttonName=='Share') {
          if(widget.choice == 'Email') {
            Email().sendEmail(widget.orderNo, widget.custName, widget.custEmail, widget.total);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Email Successfully Sent")));
          }
          else{
            Whatsapp().sendMessage(widget.custPhone, widget.custName, widget.orderNo, widget.total);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Whatsapp Message Successfully Sent")));
          }
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Receipt Printed")));
        }
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
                    'Payment Successful for ${cartProductImage.length} items',
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
                    '???${widget.total}.00',
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

  getCustomerInformation(){
    if(widget.custName!= '' || widget.custEmail!= '' || widget.custPhone!= '' || widget.orderNo!= '' || widget.total!=0
        || widget.choice!='') {
      loading = false;
    }
  }

  deleteCart(){
    for(int i=0; i<cartProductImage.length; i++){
      productImageArray.add(cartProductImage[i]);
    }

    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("Operators").doc(firebaseUser!.uid).set({
      "prodImage": productImageArray,
    }, SetOptions(merge: true)).then((value) {});

    final cartFirestoreInstance = FirebaseFirestore.instance;
    cartFirestoreInstance.collection("cart").doc(firebaseUser.uid).delete();
  }

  getProductInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("cart").doc(firebaseUser!.uid).get().then((value){
      setState(() {
        cartProductImage = value.data()!["Product Image"];
      });
    });
  }
}