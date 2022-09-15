import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Color border6GB = Colors.grey, border8GB = Colors.grey;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Highlights',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 10,),
            Row(
              children: [
                Image.asset('assets/icons/ram.png', width: 30, height: 30,),
                SizedBox(width: 20),
                Container(
                  width: width*0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('RAM + ROM',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 5,),
                      ramOptions()
                    ],
                  ),
                ),
              ],
            ),

            show('assets/icons/processor.png', 'Processor', 'Qualcomm Snapdragon 778G'),
            show('assets/icons/rearCamera.png', 'Rear Camera', '48MP + 2MP'),
            show('assets/icons/frontCamera.png', 'Front Camera', '16MP'),
            show('assets/icons/display.png', 'Display', '6.6 inch Full HD+'),
            show('assets/icons/battery.png', 'Battery', '5000 mAh'),

          ],
        ),
      ),
    );
  }

  Widget show(String iconPath, String heading, String value){
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          children: [
            Image.asset(iconPath, width: 30, height: 30,),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700
                  ),),
                Text(value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
              ],
            )
          ],
        ),
        SizedBox(height: 15,)
      ],
    );
  }

  Widget ramOptions(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            setState(() {
              border6GB = Colors.orange;
              border8GB = Colors.grey;
            });
          },
          child: Container(
            height: 45,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: border6GB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('6GB + 64GB',
                style: TextStyle(
                    fontSize: 17
                ),),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            setState(() {
              border8GB = Colors.orange;
              border6GB = Colors.grey;
            });
          },
          child: Container(
            height: 45,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: border8GB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('8GB + 128GB',
                style: TextStyle(
                    fontSize: 17
                ),),
            ),
          ),
        ),
      ],
    );
  }
}