import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/categories.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/item_card.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';

class Categories_Body extends StatelessWidget {
  const Categories_Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75
                ),
                itemBuilder: (context, index) => ItemCard(/*products[index]*/)
            ),
          ),
        )
      ],
    );
  }
}