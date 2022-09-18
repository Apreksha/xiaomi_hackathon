import 'package:flutter/material.dart';

import '../ProductDescription/products_details.dart';

class ItemCard extends StatelessWidget {
  final List allproducts;
  final int index, CategoryIndex, categoryIndex;

  ItemCard({required this.allproducts,required this.index,required this.CategoryIndex, required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                ProductDetails(categoryIndex: categoryIndex, name: allproducts[CategoryIndex]['name'][index],
                  discountprice: allproducts[CategoryIndex]['discountPrice'][index],
                  price: allproducts[CategoryIndex]['price'][index],imageMap: allproducts[CategoryIndex]['images'][index],)),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: _w / 20),
          padding: EdgeInsets.symmetric(horizontal: _w/20),
          height: _w / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.grey.shade200)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/mainLogo.png',
                image: allproducts[CategoryIndex]['images'][index]['image1'],width: _w/3, height: _w/3,
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${allproducts[CategoryIndex]['name'][index]}',
                      textAlign: TextAlign.center ,
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: _w/10,
                    ),
                    Text('₹ ${allproducts[CategoryIndex]['discountPrice'][index]}',style: TextStyle(color: Colors.orange),),
                    Text('₹ ${allproducts[CategoryIndex]['price'][index]}',style: TextStyle(decoration: TextDecoration.lineThrough),)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
