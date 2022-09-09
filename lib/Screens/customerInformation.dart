import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/Checkout/checkout.dart';

class CustomerInformation extends StatefulWidget {
  const CustomerInformation({Key? key}) : super(key: key);

  @override
  State<CustomerInformation> createState() => _CustomerInformationState();
}

class _CustomerInformationState extends State<CustomerInformation> {
  final formKey=GlobalKey<FormState>();
  Color emailText=Colors.black, whatsappText=Colors.black;
  Color emailColor = Colors.white, whatsappColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(context),
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Customer Name'
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email ID'
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
                proceedToCheckoutButton(width)
              ],
            ),
          ),
        ),
      ),
    );
  }
  InkWell proceedToCheckoutButton(var width){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Checkout()));
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

  Row choiceOfBusinessCommunication(){
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

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.orange,
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: (){
        Navigator.of(context).pop();
      },),
      title: Text('Customer Information',
        style: TextStyle(
            color: Colors.black
        ),)
    );
  }
}
