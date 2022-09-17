import 'package:flutter/material.dart';
import '../constants.dart';

class CartCounter extends StatefulWidget {

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32,
          width: 40,
          child: InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(Icons.remove, color: Colors.grey,)),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
            child: Text('01',
              style: Theme.of(context).textTheme.headline6,)
        ),
        SizedBox(
          height: 32,
          width: 40,
          child: InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(Icons.add, color: Colors.grey,)),
          ),
        ),
      ],
    );
  }
}