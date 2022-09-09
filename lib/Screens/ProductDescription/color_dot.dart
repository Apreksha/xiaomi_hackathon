import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/constants.dart';

class ColorDot extends StatelessWidget {
  final Color color;
  //final bool isSelected;
  const ColorDot({
    Key? key,
    required this.color,
    //this.isSelected=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      padding: EdgeInsets.all(2.5),
      margin: EdgeInsets.only(
          top: kDefaultPaddin/4,
          right: kDefaultPaddin/2
      ),

      child: DecoratedBox(decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
      ),),
    );
  }
}