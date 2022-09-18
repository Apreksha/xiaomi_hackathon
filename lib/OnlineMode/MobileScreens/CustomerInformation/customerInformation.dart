import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/loadingScreen.dart';

import '../Checkout/checkout.dart';
import '../appBar.dart';

class CustomerInformation extends StatefulWidget {
  const CustomerInformation({Key? key}) : super(key: key);

  @override
  State<CustomerInformation> createState() => _CustomerInformationState();
}

class _CustomerInformationState extends State<CustomerInformation> {
  String _customerName="", _email="", choice="";
  var _contactNo;
  String _address="", _city="", _state="", _pincode="";
  List addressArray=[], cityArray=[], stateArray=[], pincodeArray=[];
  Color emailText=Colors.black, whatsappText=Colors.black;
  Color emailColor = Colors.white, whatsappColor = Colors.white;
  List<dynamic> customerNameArray=[], customerPhoneArray=[], customerEmailArray=[], choiceArray=[], orderNoArray=[],
      productNameArray=[], productPriceArray=[], cartProductName=[], cartProductPrice=[];
  int total=0;
  bool loading = true;
  String name='';
  bool isVerified=true;
  String email='';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    getCustomerInformation();
    getProductInformation();
    return loading==false ? Scaffold(
      appBar: buildAppBar(context, 'Customer Information'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Operator ID: 02012001', style: TextStyle(
                      fontSize: 16
                  ),)),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _customerName=value.trim();
                  });
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Customer Name'
                ),
              ),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _contactNo=value.trim();
                  });
                },
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                ),
              ),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _email=value.trim();
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                ),
              ),
              TextField(
                onChanged: (value){
                  setState(() {
                    _address=value.trim();
                  });
                },
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _city=value.trim();
                  });
                },
                decoration: InputDecoration(
                    labelText: 'City'
                ),
              ),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _state=value.trim();
                  });
                },
                decoration: InputDecoration(
                    labelText: 'State'
                ),
              ),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _pincode=value.trim();
                  });
                },
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Pincode'
                ),
              ),

              Center(
                child: Text('Choice of Business Communication',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
              ),
              SizedBox(height: 15,),
              choiceOfBusinessCommunication(),
              proceedToCheckoutButton(width),
            ],
          ),
        ),
      ),
    ) : LoadingScreen();
  }

  InkWell proceedToCheckoutButton(var width){
    return InkWell (
      onTap: (){
        if(_customerName=="" || _contactNo=="" || _email=="" || _address=="" || _city=="" || _state=="" || _pincode==""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill all the entries')));
        }
        else if(choice==""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select any one choice of business communication')));
        }
        else {
          storeCustomerInformation();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Checkout(choice: choice, custName: _customerName, custAdd: _address, custCity: _city,
                custEmail: _email, custPhone: _contactNo, custPincode: _pincode, custState: _state, orderNo: '45866426', total: total,prodName: cartProductName,prodPrice: cartProductPrice,
              )));
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(width*0.35,20,10,10),
        height: 50,
        width: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('Proceed to Checkout',
            style: TextStyle(
                fontSize: 18
            ),),
        ),
      ),
    ) ;
  }

  Widget choiceOfBusinessCommunication(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            setState(() {
              emailColor = Color.fromARGB(255, 231, 67, 57);
              whatsappColor = Colors.white;
              emailText = Colors.white;
              whatsappText = Colors.black;
              choice="Email";
            });
          },
          child: Container(
            height: 45,
            width: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: emailColor,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('Email',
                style: TextStyle(
                    color: emailText,
                    fontSize: 17
                ),),
            ),
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){
            setState(() {
              whatsappColor = Color.fromARGB(255, 52, 168, 85);
              emailColor = Colors.white;
              whatsappText = Colors.white;
              emailText = Colors.black;
              choice="Whatsapp";
            });
          },
          child: Container(
            height: 45,
            width: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: whatsappColor,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('Whatsapp',
                style: TextStyle(
                    color: whatsappText,
                    fontSize: 17
                ),),
            ),
          ),
        ),
      ],
    );
  }

  Future storeCustomerInformation() async{
    for(int i=0; i<cartProductName.length; i++){
      customerNameArray.add(_customerName);
      customerEmailArray.add(_email);
      customerPhoneArray.add(_contactNo);
      choiceArray.add(choice);
      orderNoArray.add('45866426');
      addressArray.add(_address);
      cityArray.add(_city);
      stateArray.add(', $_state');
      pincodeArray.add(', $_pincode');
    }

    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;

    firestoreInstance.collection("Operators").doc(firebaseUser!.uid).set({
      "custName": customerNameArray,
      "custPhone": customerPhoneArray,
      "custEmail": customerEmailArray,
      "choice" : choiceArray,
      "orderNo" : orderNoArray,
      "custAdd": addressArray,
      "custCity": cityArray,
      "custState": stateArray,
      "prodName" : cartProductName,
      "prodPrice" : cartProductPrice,
      "total" : total,
      "custPincode": pincodeArray,
      'name':name,
      'isVerified':isVerified,
      'email':email
    }, SetOptions(merge: true)).then((value) {});
  }

  getCustomerInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("Operators").doc(firebaseUser!.uid).get().then((value){
      setState(() {
        customerNameArray = value.data()!["Customer Name"];
        customerEmailArray = value.data()!["Customer Email"];
        customerPhoneArray = value.data()!["Customer Phone"];
        choiceArray = value.data()!["Choice"];
        addressArray = value.data()!["Customer Address"];
        cityArray = value.data()!["Customer City"];
        stateArray = value.data()!["Customer State"];
        pincodeArray = value.data()!["Customer Pincode"];
        orderNoArray = value.data()!["Order No"];
        email = value.data()!['email'];
        isVerified = value.data()!['isVerified'];
        name = value.data()!['name'];
      });
    });
  }

  getProductInformation(){
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("cart").doc(firebaseUser!.uid).get().then((value){
      setState(() {
        cartProductName = value.data()!["Product Name"];
        cartProductPrice = value.data()!["Product Price"];
        total = value.data()!["total"];

        if(value.data()!["total"]!= null || value.data()!["Product Price"]!= null || value.data()!["Product Name"]!= null){
          loading = false;
        }
      });
    });
  }
}