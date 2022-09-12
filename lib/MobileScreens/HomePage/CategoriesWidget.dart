import 'package:flutter/material.dart';
class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}
List items=[
  'Smartphones',
  'Laptops',
  'Accessories',
  'Bundle Sales',
  'SmartHome',
  'tv'
];
class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index){
          return category(index);
        });
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
}
