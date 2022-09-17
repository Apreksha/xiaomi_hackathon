import 'package:flutter/material.dart';

import 'HomePage/HomeScreen.dart';

class StoreInformation extends StatefulWidget {
  const StoreInformation({Key? key}) : super(key: key);

  @override
  State<StoreInformation> createState() => _StoreInformationState();
}

class _StoreInformationState extends State<StoreInformation> {
  var storeTypeList = [
    'Select',
    'Mi Home',
    'Mi Store',
  ];
  var machineTypeList = [
    'Select',
    '1000 (Mobile)',
    '2000 (Tablet)',
    '3000 (Desktop)',
  ];

  String storeTypeDropDownValue = 'Select';
  String machineTypeDropDownValue = 'Select';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text('Store Information',
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),

      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Store Type',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                DropdownButton(
                  value: storeTypeDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: storeTypeList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      storeTypeDropDownValue = newValue!;
                    });
                  },
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text('Store Name')
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Point of Sales ID',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                DropdownButton(
                  value: machineTypeDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: machineTypeList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      machineTypeDropDownValue = newValue!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: height*0.06,),
            InkWell(
              child: Container(
                  width: 100,
                  margin: EdgeInsets.only(left: width*0.5),
                  height: 55,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Next',
                      style: TextStyle(
                          fontSize: 20
                      ),),
                  )),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}