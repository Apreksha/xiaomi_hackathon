import 'package:flutter/material.dart';

class FillAddress extends StatefulWidget {
  const FillAddress({Key? key}) : super(key: key);

  @override
  State<FillAddress> createState() => _FillAddressState();
}

class _FillAddressState extends State<FillAddress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text('Please make sure your address is accurate. It cannot be changed once order is placed.',
                  style: TextStyle(color: Colors.grey.shade700),),
              ),
              SizedBox(height: 5,),
              heading('Name'),
              textfield('Name'),
              heading('Pincode'),
              textfield('Pincode'),
              heading('Address'),
              textfield('Address'),
              heading('City'),
              textfield('City'),
              heading('State'),
              textfield('State'),
              heading('Email'),
              textfield('Email'),
              heading('Phone'),
              textfield('+91 Phone Number'),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Use as default',
                        style: TextStyle(
                            fontSize: 18
                        ),)),
                  //toggle button
                ],
              ),
              SizedBox(height: 10,),
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text('SAVE',textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          color: Colors.orange
                        ),),
                    )),
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Saved"),
                    duration: Duration(seconds: 3),));
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container heading(String s){
    return Container(
        margin: EdgeInsets.only(left: 15),
        child: Text(s,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,

          ),));
  }

  Container textfield(String s){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: s,
            border: InputBorder.none
        ),
      ),
    );
  }
}
