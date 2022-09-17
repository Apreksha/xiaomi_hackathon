import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/productDB.dart';

import 'HomePage/HomeScreen.dart';

class DataSearch extends SearchDelegate<String> {
  late List alldata;
  DataSearch({required this.alldata});
  late String TopicName;

  bool cross=false;
  final List topics=[
    'Mi NoteBook Ultra',
    'Xiaomi Notebook Pro',
    'Mi Notebook Pro',
    'Mi Notebook 14 Horizon',
    'Mi NoteBook Ultra Win 11',
    'Mi Notebook 14(IC)',
    'Mi Notebook 14 E-Learning Edition',
    "RedmiBook 15 Pro",
    "RedmiBook 15",
    "RedmiBook 15",
    "RedmiBook 15 Pro",
    "Mi 30W Wireless Charger",
    "Mi Car Charger Basic",
    "Mi 18W Dual Port Charger",
    "Mi USB Type C Cable",
    "Xiaomi 6A HyperCharge Cable",
    "Xiaomi Pad 5 Cover",
    "Xiaomi Smart Pen",
    "Mi Webcam HD",
    "Mi Portable Wireless Mouse White",
    "Mi Step Out Backpack (Pack of 3)",
    "Mi Step Out Backpack (Pack of 2)",
    "Mi Organic Solid T-Shirt",
    "Mi Smart LED Bulb",
    "Mi Step Out Backpack Royal Blue",
    "Mi Business Casual Backpack Blue",
    "Redmi Smart TV",
    "Redmi Smart TV 32",
    "Redmi Smart TV 43",
    "Redmi Smart TV 4K",
    "Redmi Smart TV 4K Ultra",
    "Redmi K50i 5G",
    "Redmi Note 11 Pro+ 5G",
    "Redmi Note 11T 5G",
    "Redmi Note 11 SE",
    "Redmi Note 11S",
    "Redmi Note 11 Pro",
    "Mi Robot Vacuum",
    "Xiaomi Smart Air Fryer + Smart Speaker",
    "Mi Air Purifier Filter",
    "Mi Air Purifier 3",
    "Xiaomi 12 Pro 5G",
    "Xiaomi 11i Hypercharge 5G",
    "Xiaomi 11i 5G",
    "Xiaomi 11 Lite NE 5G",
    "Mi 11X 5G",
    "Mi 11 Lite",
    "Mi 11 Ultra 5G",
    "Xiaomi Smart TV 5A Pro",
    "Mi LED TV 4A PRO",
    "Mi QLED TV 75",
    "Mi TV 4A Horizon",
  ];
  final recentTopic = [
    "Redmi Smart TV",
    "Mi NoteBook Ultra",
    "Redmi Note 11T 5G",
    "Mi QLED TV 75"
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
    late List allproducts;
    productDB().productDetails().then((value) => allproducts=value);
    final suggestionList = query.isEmpty
        ?recentTopic
        :topics.where((element) => element.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap:()async{
        showResults(context);
        TopicName= suggestionList[index];
        int indexes;
        if(alldata[0]['name'].contain(TopicName)){
        indexes =   alldata[0]['name'].indexOf(TopicName);
        }else{
          indexes=10;
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
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
        int indexes = topics.indexOf(TopicName);
        if(alldata[0]['name'].contain(TopicName)){
          indexes =   alldata[0]['name'].indexOf(TopicName);
        }else{
          indexes=10;
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
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