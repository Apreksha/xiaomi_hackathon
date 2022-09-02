import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/products_details.dart';
import 'package:xiaomi_hackathon/constants.dart';

class ItemCard extends StatelessWidget {

  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Image.asset('assets/images/smartphone.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
            child: Text(
              'MI Note 11',
              style: TextStyle(
                  color: kTextLightColor
              ),
            ),
          ),
          Text(
            '\$234',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
