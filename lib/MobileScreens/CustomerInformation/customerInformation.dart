import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CustomerInformation/choiceOfBusinessCommunication.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerInformation extends StatefulWidget {
  const CustomerInformation({Key? key}) : super(key: key);

  @override
  State<CustomerInformation> createState() => _CustomerInformationState();
}

class _CustomerInformationState extends State<CustomerInformation> {
  final formKey=GlobalKey<FormState>();
  String _customerName="", _email="", choice="";
  var _contactNo;
  Color emailText=Colors.black, whatsappText=Colors.black;
  Color emailColor = Colors.white, whatsappColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(context, 'Customer Information'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
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
                  child: Text('Operator ID: 54668468464', style: TextStyle(
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
                SizedBox(height: 15,),
                Center(
                  child: Text('Choice of Business Communication',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                ),
                SizedBox(height: 15,),
                choiceOfBusinessCommunication(),
                //ChoiceOfBusinessCommunication(),
                proceedToCheckoutButton(width)
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell proceedToCheckoutButton(var width){
    return InkWell (
      onTap: (){
        storeCustomerInformation();
        Navigator.of(context).pushNamed('checkout');
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
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("Operators").doc('02012001').get().then((
        value) {
      firestoreInstance.collection("Operators")
          .doc('02012001'/*firebaseUsehhbr.uid*/)
          .update({
        "Customer Name": FieldValue.arrayUnion([_customerName]),
        "Customer Phone": FieldValue.arrayUnion([_contactNo]),
        "Customer Email": FieldValue.arrayUnion([_email]),
        "Choice" : FieldValue.arrayUnion([choice])
      });
    });
  }
}
