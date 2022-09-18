import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../CartScreen/cart.dart';

class CartButton extends StatefulWidget {
  final String productName, image;
  final int productPrice;
  const CartButton({Key? key, required this.productName, required this.productPrice, required this.image}) : super(key: key);

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  List productNameArray=[], productPriceArray=[], imageArray=[];
  int total = 0;

  @override
  Widget build(BuildContext context) {
    getProductInformation();
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async{
            storeProductInformation();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
          child:  Container(
            padding: EdgeInsets.symmetric(horizontal: _w/30,vertical:_w/30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(_w/20)),
              color: Colors.green,
            ),
            height: _h/15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.card_travel,weight: _w/30),
                Text('Buy Now',
                  style: TextStyle(fontSize: _w/30,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
        SizedBox(
          width: _w/10,
        ),
        GestureDetector(
          onTap: (){
            storeProductInformation();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Cart')));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _w/30,vertical:_w/30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(_w/20)),
              color: Colors.orange,
            ),
            height: _h/15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shopping_cart,weight: _w/30),
                Text('Add To Cart',
                  style: TextStyle(fontSize: _w/30,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future storeProductInformation() async{
    productNameArray.add(widget.productName);
    productPriceArray.add(widget.productPrice);
    imageArray.add(widget.image);
    total += widget.productPrice;

    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("cart").doc(firebaseUser!.uid).set({
      "Product Name": productNameArray,
      "Product Price": productPriceArray,
      "Product Image": imageArray,
      "total" : total
    }, SetOptions(merge: true)).then((value) {});
  }

  getProductInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("cart").doc(firebaseUser!.uid).get().then((value){
      setState(() {
        productNameArray = value.data()!["Product Name"];
        productPriceArray = value.data()!["Product Price"];
        imageArray = value.data()!["Product Image"];
        total = value.data()!["total"];
      });
    });
  }
}
