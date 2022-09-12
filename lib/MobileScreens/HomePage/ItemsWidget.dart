import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xiaomi_hackathon/MobileScreens/HomePage/CategoriesWidget.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/products_details.dart';
import 'package:xiaomi_hackathon/MobileScreens/productDB.dart';


class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return FutureBuilder(
      future: productDB().productDetails(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Container(
              padding: EdgeInsets.only(bottom: _w/40, left: _w/40, right: _w/40),
              child: AnimationLimiter(
                child: GridView.count(
                  childAspectRatio: 0.68,
                  physics:NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(_w / 60),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    6,
                        (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: Duration(milliseconds: 500),
                        columnCount: columnCount,
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 900),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: _w / 30, left: _w / 60, right: _w / 60),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(image: NetworkImage(''), height: _h/10,),
                                  Text('Product Name'),
                                  Text('₹ discounted price',style: TextStyle(color: Colors.orange),),
                                  Text('₹ real price',style: TextStyle(decoration: TextDecoration.lineThrough),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }else{
            return Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
