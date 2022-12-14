import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../appBar.dart';
import '../loadingScreen.dart';
import 'orderHistoryDetail.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List customerName=[], productPrice=[], orderNo=[];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    getCustomerInformation();

    double _w = MediaQuery.of(context).size.width;
    return customerName.isEmpty ? loading==false
        ? Container(
        color: Colors.grey.shade100,
        child: Image.asset('assets/images/emptyorderHistory.png'))
        : LoadingScreen()
        : Scaffold(
      appBar: buildAppBar(context, 'Order History'),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics:
          BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: orderNo.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                verticalOffset: -250,
                child: ScaleAnimation(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderHistoryDetails(index: index)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: _w / 20),
                      padding: EdgeInsets.only(right: 5),
                      height: _w * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: _w * 0.8,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    itemCardDetails('SO Number: ', orderNo[index]),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Text('Delivered', style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                ),
                                itemCardDetails('Invoice Number: ', '58185464686'),
                                itemCardDetails('Customer Name: ', customerName[index]),
                                itemCardDetails('Amount: ', '??? ${productPrice[index]}')
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.black,)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
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
          fontWeight: FontWeight.bold
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

  getCustomerInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("Operators").doc(firebaseUser!.uid).get().then((value){
      setState(() {
        customerName = value.data()!["custName"];
        orderNo = value.data()!["orderNo"];
        productPrice = value.data()!["prodPrice"];
        if(value.data()!["custName"]!= null || value.data()!["orderNo"]!= null || value.data()!["prodPrice"]!= null){
          loading = false;
        }
      });
    });
  }
}