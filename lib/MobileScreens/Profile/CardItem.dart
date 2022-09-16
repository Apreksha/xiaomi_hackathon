import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/order_history.dart';

class CardItem extends StatelessWidget {
  int index; 
  CardItem({
    required this.index
  });
  late List<String> field=['Rating','Order History'];
  late List<Icon> icons = const[
    Icon(
    Icons.card_giftcard,
    size: 40.0,
    color: Colors.yellow,
  ),
    Icon(
      Icons.history,
      size: 40.0,
      color: Colors.green,
    )];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icons[index],
              const SizedBox(width: 24.0),
              Text(
                field[index],
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ),
    );
  }
}