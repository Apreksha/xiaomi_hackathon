import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/ProductDescription/products_details.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/productDB.dart';

import 'HomePage/HomeScreen.dart';

class DataSearch extends SearchDelegate<String> {
  late List alldata;
  DataSearch({required this.alldata});
  late String TopicName;
  bool cross=false;

  final List discountPrice=[
    66999,28999,26999,25999,29999,23999,69999,41999,38999];

  final List price=[
    84999,33999,31999,33999,34999,25999,74999,54999,49999];

  final List topics=[
    "Xiaomi 12 Pro 5G",
    "Xiaomi 11i Hypercharge 5G",
    "Xiaomi 11i 5G",
    "Xiaomi 11 Lite NE 5G",
    "Mi 11X 5G",
    "Mi 11 Lite",
    "Mi 11 Ultra 5G",
    "Xiaomi 11T Pro 5G",
    "Mi 11X Pro 5G"
  ];

  final recentTopic = [
    "Xiaomi 11i 5G",
    "Xiaomi 11 Lite NE 5G",
    "Mi 11X 5G",
    "Mi 11 Lite",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
        cross = true;
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation),
        onPressed:(){
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ?recentTopic
        :topics.where((element) => element.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap:()async{
        showResults(context);
        TopicName= suggestionList[index];

        int indexes = alldata[7]['name'].indexOf(TopicName);

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(categoryIndex:7,name: TopicName,
            discountprice: discountPrice[index], price: price[index],
            imageMap: alldata[7]['images'][indexes])));
      } ,
      leading: Icon(Icons.code),
      title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
          )]
      ),),
    ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ?recentTopic
        :topics.where((element) => element.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap:()async{
        showResults(context);
        TopicName= suggestionList[index];
        int indexes;
        if(alldata[7]['name'].contain(TopicName)){
          indexes = alldata[7]['name'].indexOf(TopicName);
        }else{
          indexes=10;
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(categoryIndex:7,name: TopicName,
            discountprice: alldata[7]['discountPrice'][indexes], price: alldata[7]['price'][indexes],
            imageMap: alldata[7]['images'][indexes])));
      } ,
      leading: Icon(Icons.code),
      title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
          )]
      ),),
    ),
      itemCount: suggestionList.length,
    );
  }
}