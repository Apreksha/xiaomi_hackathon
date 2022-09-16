import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/productInfo.dart';
import 'sliderIndicator.dart';

class ProductBody extends StatefulWidget {
  String name;
  int discountprice;
  int price;
  Map<String,dynamic> imageMap;
  ProductBody({required this.name,required this.discountprice,required this.price,required this.imageMap});

 @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {

  int activeIndex=0;
  late List items;

  setActiveDot(int index) {
    setState(() {

      activeIndex = index;
    });
  }

  @override
  void initState() {
    items = widget.imageMap.values.toList();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Container(
      padding:EdgeInsets.only(left:_w/30,right: _w/30),
      height: _h,
      color: Colors.white,
      child: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CarouselSlider(
                  items: items.map((item) {
                    return Builder(
                    builder:(BuildContext context){
                      return Stack(
                      children:<Widget>[
                      Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                        image: NetworkImage("$item"),
                        fit: BoxFit.fitHeight,
                        ),
                        ),
                        ),
                                    ]
                                    );
                        }
                    );
                      }).toList(),
                  //Slider Container properties
                  options: CarouselOptions(
                    height: _h/2.5,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) => setActiveDot(index) ,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(items.length, (idx) {
                      return activeIndex == idx ? ActiveDot() : InactiveDot();
                    })),
                SizedBox(
                  height: _h/20,
                ),
                Container(
                  color: Colors.white,
                  child: ProductInfo(name: widget.name, discountprice: widget.discountprice, price: widget.price),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



