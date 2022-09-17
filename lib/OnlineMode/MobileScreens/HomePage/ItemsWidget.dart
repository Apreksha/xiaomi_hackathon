import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../productDB.dart';


class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List allproducts=[];
  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return FutureBuilder(
      future: productDB().productDetails().then((value) =>allproducts = value),
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
                              padding: EdgeInsets.symmetric(horizontal: _w/50,vertical: _h/50),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/mainLogo.png',
                                    image: allproducts[index]['images'][0]['image1'],width: _w/3, height: _w/3,
                                  ),
                                  SizedBox(height: _h/40,),
                                  Text('${allproducts[index]['name'][0]}',textAlign: TextAlign.center ,style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('₹ ${allproducts[index]['discountPrice'][0]}',style: TextStyle(color: Colors.orange),),
                                  Text('₹ ${allproducts[index]['price'][0]}',style: TextStyle(decoration: TextDecoration.lineThrough),)
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
              backgroundColor: Colors.grey.shade200,
                body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
