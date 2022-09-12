import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';

class FillAddress extends StatefulWidget {
  const FillAddress({Key? key}) : super(key: key);

  @override
  State<FillAddress> createState() => _FillAddressState();
}

class _FillAddressState extends State<FillAddress> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(context, 'Delivery Information'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.streetAddress,
                maxLines: 2,
                decoration: InputDecoration(
                    labelText: 'Address',
                  
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'City'
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'State'
                ),
              ),
              TextFormField(
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Pincode'
                ),
              ),
              SizedBox(height: 10,),
              saveButton(width)
            ],
          ),
        ),
      ),
    );
  }

  InkWell saveButton(var width){
    return InkWell(
      onTap: (){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Saved"),
          duration: Duration(seconds: 3),));
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(width*0.45,20,10,10),
        height: 60,
        width: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('Save',
            style: TextStyle(
                fontSize: 18
            ),),
        ),
      ),
    ) ;
  }
}
