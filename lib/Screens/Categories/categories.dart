import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Smartphones','TV','Laptop','Wearables','Audio','Phone Accessories','Laptop Accessories'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
          height: 25,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index)=>buildCategory(index)
          )
      ),
    );
  }

  Widget buildCategory(int index){
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin/4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
      onTap: (){
        setState(() {
          selectedIndex=index;
        });
      },
    );
  }
}