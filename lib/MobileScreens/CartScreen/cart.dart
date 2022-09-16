import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/checkout.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
import 'package:xiaomi_hackathon/MobileScreens/CustomerInformation/customerInformation.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';

import '../productDB.dart';

class Cart extends StatefulWidget {

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late List image=[];
  late List productName=[];
  late List quantity=[];
  late List price=[];
  late double totalPrice =0;
  @override

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getCart('12345'),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Scaffold(
              appBar: buildAppBar(context, 'Cart'),
              body: CartBody(image: image, productName: productName, quantity: quantity, price: price),
              bottomNavigationBar: buildBottomNavigationBar(context)
          );
        }else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    )  ;
  }

  Container buildBottomNavigationBar(BuildContext context){
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Container(
      height: height*0.2,
      padding: EdgeInsets.symmetric(
          vertical: (15 / 375.0) * width,
          horizontal: (30 / 375.0) * width
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15)
          )]
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: (40 / 375.0) * width,
                  width: (40 / 375.0) * width,
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset("assets/icons/receipt.png"),
                ),
                Row(
                  children: [
                    Text('Add Voucher Code'),
                    const SizedBox(width: 10,),
                    Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor,),
                  ],
                )
              ],
            ),
            SizedBox(height: (20 / 375.0) * height,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: 'Total:\n',
                    children: [
                      TextSpan(
                          text: '₹ $totalPrice',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          )
                      )
                    ]
                )),
                proceedButton(height, width, context)
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell proceedButton(var height, var width, BuildContext context){
    return InkWell(
      child: Container(
          height: height*0.05,
          width: width*0.4,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Center(child: Text('Proceed',
            style: TextStyle(
              fontSize: 20,
            ),))),
      onTap: () async{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Clicked')));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerInformation()));
        final firestoreInstance = FirebaseFirestore.instance;
        firestoreInstance.collection("Operators").doc('02012001').get().then((
            value) {
          firestoreInstance.collection("Operators")
              .doc('02012001'/*firebaseUser.uid*/)
              .update({
            "Order No": FieldValue.arrayUnion(["468567767"]),
          });
        });
      },
    );
  }

  Future<DocumentSnapshot<Map<String,dynamic>>> getCart(String uid) async{
    final firestoreInstance = FirebaseFirestore.instance;
    var currentUser = await firestoreInstance.collection('cart').doc(uid).get();
    firestoreInstance.collection("cart").doc(uid/*firebaseUser!.uid*/).get().then((value){
      setState((){
        image = value.data()!['image'];
        productName = value.data()!['productName'];
        quantity =value.data()!['quantity'];
        price = value.data()!['price'];
      });
    });
    return currentUser;
  }
}