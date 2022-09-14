import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/productInfo.dart';
import 'sliderIndicator.dart';

class ProductBody extends StatefulWidget {


 @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {

  int activeIndex=0;

  setActiveDot(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  List items=["https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1641445082.61868030.png",
    "https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1650980925.15485792.jpg",
    "https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1650980960.19661951.jpg"];
  
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
                  height: _h,
                  color: Colors.white,
                  child: ProductInfo(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



