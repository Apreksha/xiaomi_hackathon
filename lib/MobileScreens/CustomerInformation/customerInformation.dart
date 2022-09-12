import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/checkout.dart';
import 'package:xiaomi_hackathon/MobileScreens/CustomerInformation/choiceOfBusinessCommunication.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
import 'package:xiaomi_hackathon/MobileScreens/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerInformation extends StatefulWidget {
  const CustomerInformation({Key? key}) : super(key: key);

  @override
  State<CustomerInformation> createState() => _CustomerInformationState();
}

class _CustomerInformationState extends State<CustomerInformation> {
  final formKey=GlobalKey<FormState>();
  String _customerName="", _email="";
  var _contactNo;

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
                ChoiceOfBusinessCommunication(),
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
        storeCustomerInformation(customerName: _customerName, email: _email, phone: _contactNo);
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
        child: Text('Proceed to Checkout',
          style: TextStyle(
            fontSize: 18
          ),),
      ),
    ) ;
  }

  Future storeCustomerInformation({required String customerName, required String email, required var phone}) async{
    final docUser = FirebaseFirestore.instance.collection('Operators').doc('02012001');
    var length = FirebaseFirestore.instance.collection('Operators').doc('02012001').snapshots().length;

    final json={
      'Customer Name' : customerName,
      'Email' : email,
      'Contact Number' : phone,
    };
    await docUser.set(json);
  }
}
