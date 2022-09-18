import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'item_card.dart';

class Categories_Body extends StatefulWidget {
  List allproducts;
  int CategoryIndex;
  Categories_Body({required this.allproducts,required this.CategoryIndex});

  @override
  State<Categories_Body> createState() => _Categories_BodyState();
}

class _Categories_BodyState extends State<Categories_Body> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();

    ;
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;
    if(widget.CategoryIndex == 7 || widget.CategoryIndex == 0 || widget.CategoryIndex == 8){
      int tempInd;
      if(widget.CategoryIndex == 7){
        tempInd = widget.CategoryIndex-2;
      }
      else if(widget.CategoryIndex == 0){
        tempInd = widget.CategoryIndex+1;
      }
      else{
        tempInd = widget.CategoryIndex-4;
      }

      double _h = MediaQuery.of(context).size.height;
      return Column(
        children: [
          SizedBox(
            height: _h/30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200),
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.all(10),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 20),
                labelPadding:
                EdgeInsets.only(left: _w/6.5, right: _w/6.5, top: _h/60, bottom: _h/60),
                indicator: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                controller: _tabController,
                tabs: [
                  Text('Xiaomi'),
                  Text('Redmi'),
                ]),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children:[
                  productWidget(_w,widget.CategoryIndex),
                  productWidget(_w,tempInd)
                ]),
          )
        ],
      );
    }
    else{
      return productWidget(_w,widget.CategoryIndex);
    }

  }

  Widget productWidget(double _w, int catIndex){
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics:
        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: widget.allproducts[catIndex]['images'].length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              verticalOffset: -250,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: ItemCard(categoryIndex: widget.CategoryIndex, allproducts: widget.allproducts, index: index, CategoryIndex: catIndex,),
              ),
            ),
          );
        },
      ),
    );
  }
}