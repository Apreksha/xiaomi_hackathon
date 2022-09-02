import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/constants.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32,
          width: 40,
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                if(numOfItems>1) {
                  numOfItems--;
                }
              });
            },
            child: Icon(Icons.remove, color: Colors.grey,),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
            child: Text(numOfItems.toString().padLeft(2,"0"),
              style: Theme.of(context).textTheme.headline6,)
        ),
        SizedBox(
          height: 32,
          width: 40,
          child: OutlinedButton(
            style: ButtonStyle(
            ),
            onPressed: () {
              setState(() {
                numOfItems++;
              });
            },
            child: Icon(Icons.add, color: Colors.grey,),
          ),
        ),
      ],
    );
  }
}