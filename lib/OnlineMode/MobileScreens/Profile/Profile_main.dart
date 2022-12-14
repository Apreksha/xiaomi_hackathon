import 'package:flutter/material.dart';
import '../OrderHistory/order_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'StackContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  List orderNoArray = [];

  @override
  Widget build(BuildContext context) {
    getCustomerInformation();

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const StackContainer(),
            showMiPoints(),
            viewOrderHistory(),
          ],
        ),
      ),
    );
  }

  Widget showMiPoints(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.card_giftcard,
                size: 40.0,
                color: Colors.yellow,
              ),
              SizedBox(width: 24.0),
              Text(
                'Mi Tokens',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Spacer(),
              Text((orderNoArray.length*100).toString(),
                style: TextStyle(
                    fontSize: 18
                ),)
            ],
          ),
        ),
      ),
    );
  }

  Widget viewOrderHistory(){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderHistory()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 21.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.history,
                  size: 40.0,
                  color: Colors.green,
                ),
                SizedBox(width: 24.0),
                Text(
                  'Order History',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
          ),
        ),
      ),
    );
  }

  getCustomerInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("Operators").doc(firebaseUser!.uid).get().then((value){
      setState(() {
        orderNoArray = value.data()!["orderNo"];
      });
    });
  }
}