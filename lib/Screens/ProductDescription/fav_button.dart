import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  final Color color;
  const FavButton({Key? key, required this.color}) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.all(8.5),
          decoration: BoxDecoration(
              color: Color(0xFFFF6464),
              shape: BoxShape.circle
          ),
          child: Icon(Icons.favorite, color: Colors.white,),
        ),
        onTap: (){
          setState(() {

          });
        }
    );
  }
}