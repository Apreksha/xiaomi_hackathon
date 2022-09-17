import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../CustomerInformation/customerInformation.dart';
import '../appBar.dart';
import '../loadingScreen.dart';
import '../productDB.dart';
import 'cart_body.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List productNameArray=[], productPriceArray=[], imageArray=[];
  int total = 0;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    getProductInformation();

    return productNameArray.isEmpty ? loading==false ? Container(
        color: Colors.white,
        child: Image.asset('assets/images/empty_cart.png'))
        : LoadingScreen()
        : Scaffold(
        appBar: buildAppBar(context, 'Cart'),
        body: CartBody(productNameArray: productNameArray, productPriceArray: productPriceArray, imageArray: imageArray),
        bottomNavigationBar: buildBottomNavigationBar(context)
    );
  }

  Container buildBottomNavigationBar(BuildContext context){
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Container(
      height: height*0.15,
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
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15)
            )]
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(TextSpan(
              text: 'Total:\n',
              children: [
                TextSpan(
                    text: '₹ $total',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    )
                )
              ]
          )),
          proceedButton(height, width, context)
        ],
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerInformation()));
      },
    );
  }

  getProductInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("cart").doc('12345'/*firebaseUser!.uid*/).get().then((value){
      setState(() {
        productNameArray = value.data()!["Product Name"];
        productPriceArray = value.data()!["Product Price"];
        imageArray = value.data()!["Product Image"];
        total = value.data()!["total"];
      });
    });
  }
}