import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class OfflineForm extends StatefulWidget {
  const OfflineForm({Key? key}) : super(key: key);

  @override
  State<OfflineForm> createState() => _OfflineFormState();
}
late List<String> choice=[];
late List<String> custAdd=[];
late List<String> custCity=[];
late List<String> custEmail=[];
late List<String> custName=[];
late List<String> custPhone=[];
late List<String> custPincode=[];
late List<String> custState=[];
late List<String> orderNo=[];
late List<String> prodName=[];
late List<String> prodPrice=[];
late List<String> paymentMode=[];

class _OfflineFormState extends State<OfflineForm> {

  final _myBox = Hive.box('mybox');


  @override
  void initState() {
    // TODO: implement initState
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(onPressed: (){writeData();},
                child: Text('Purchase'))
          ],
        ),
      ),
    );
  }
void writeData(){
  _myBox.put('choice',choice );
  _myBox.put('custAdd',custAdd );
  _myBox.put('custCity',custCity );
  _myBox.put('custEmail',custEmail );
  _myBox.put('custName',custName );
  _myBox.put('custPhone',custPhone );
  _myBox.put('custPincode',custPincode );
  _myBox.put('custState',custState );
  _myBox.put('orderNo',orderNo );
  _myBox.put('prodName',prodName );
  _myBox.put('prodPrice',prodPrice );
  _myBox.put('paymentMode', paymentMode);
}

  void readData(){
    choice = _myBox.get('choice');
    custAdd = _myBox.get('custAdd');
    custCity = _myBox.get('custCity');
    custEmail = _myBox.get('custEmail');
    custName = _myBox.get('custName');
    custPhone = _myBox.get('custPhone');
    custPincode = _myBox.get('custPincode');
    custState = _myBox.get('custState');
    orderNo = _myBox.get('orderNo');
    prodName = _myBox.get('prodName');
    prodPrice = _myBox.get('prodPrice');
    paymentMode = _myBox.get('paymentMode');

  }
}
Widget inputFile({label})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(

        onChanged: (text){
          if(label == "choice"){
             choice.add(text);
          }else if(label == "custAdd"){
            custAdd.add(text) ;
          }else if(label == "custCity"){
            custCity.add(text) ;
          }else if(label == "custEmail"){
            custEmail.add(text);
          }else if(label == "custName"){
            custName.add(text);
          }else if(label == "custPhone"){
            custPhone.add(text);
          }else if(label == "custPincode"){
            custPincode.add(text);
          }else if(label == "custState"){
            custState.add(text);
          }else if(label == "orderNo"){
            orderNo.add(text);
          }else if(label == "prodName"){
            prodName.add(text);
          }else if(label == "prodPrice"){
           prodPrice.add(text);
          }else{
            paymentMode.add(text);
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey.shade400
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}