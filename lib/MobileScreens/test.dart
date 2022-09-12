import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/appBar.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}
List<Color> colors=[Colors.blue, Colors.purple, Colors.red, Colors.pink, Colors.green, Colors.black];
List items=[
  'Smartphones',
  'Laptops',
  'Accessories',
  'Bundle Sales',
  'SmartHome',
  'tv'
];
class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Home'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index){
                    return category(index);
                  }),
            ),
            body()
          ],
        ),
      ),
    );
  }
  Widget category(int index){
    return InkWell(
      onTap: (){
      },
      child: Container(
        width: 190,
        height: 50,
        margin: EdgeInsets.symmetric( horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person,size: 20,),
            Text(items[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.orange
              ),)
          ],
        ),
      ),
    );
  }

  Container body(){
    return Container(
      color: Colors.orange,
      child: Image.asset('assets/images/smartphone.png',height: 1000,),
    );
  }
}