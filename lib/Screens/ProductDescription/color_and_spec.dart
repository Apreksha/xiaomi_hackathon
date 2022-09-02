import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/color_dot.dart';

class ColorAndSpec extends StatelessWidget {
  final List color;
  final List spec;
  const ColorAndSpec({Key? key, required this.color, required this.spec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i=0;i<spec.length;i++)
                  Text('${spec[i]}'),
                //Text('4GB+64GB'),
              ],
            ),
            Row(
              children: [
                /*for(int i=0;i<color.length;i++)
                  ColorDot(color: color[i]),
                */ColorDot(color: Color(0xFF356C95)),
                ColorDot(color: Color(0xFFF8C078),),
                ColorDot(color: Color(0xFFA29B9B),),
              ],
            )
          ],
        ),
      ],
    );
  }
}