import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FormUI extends StatefulWidget {
  const FormUI({Key? key}) : super(key: key);

  @override
  State<FormUI> createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {

  late String _customerName='';
  late String _contactNo='';
  late String _email='';
  late String _address='';
  late String _city='';
  late String _state='';
  late String _pincode='';
  late String _prodName='';
  late String _prodPrice='';

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

  final _myBox = Hive.box('mybox');

  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double _h = MediaQuery.of(context).size.height;

  readData();
  return Scaffold(
      appBar: AppBar(
        title: Text('Customer Information'),
      ),
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
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _prodName=value.trim();
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Product Name'
                ),
              ),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    _prodPrice=value.trim();
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Product Price'
                ),
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    addData();
                    writeData();
                    print(_myBox.get('custName'));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width/10,vertical: _h/60),
                    color: Colors.orange,
                    child: Text('Purchase',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void addData(){
    choice.add('Offline');
    custAdd.add(_address);
    custCity.add(_city);
    custEmail.add(_email);
    custName.add(_customerName);
    custPhone.add(_contactNo);
    custPincode.add(_pincode);
    custState.add(_state);
    orderNo.add('45866426');
    prodName.add(_prodName);
    prodPrice.add(_prodPrice);
    paymentMode.add('Cash');
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
    if(_myBox.get('choice')!=null) {
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
}
