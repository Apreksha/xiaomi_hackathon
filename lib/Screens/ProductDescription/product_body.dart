import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/add_to_cart_and_buy_button.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/cart_counter.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/color_and_spec.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/fav_button.dart';
import 'package:xiaomi_hackathon/Screens/ProductDescription/product_title_with_image.dart';
import 'package:xiaomi_hackathon/constants.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )
                  ),
                  child: Column(
                    children: [
                      ColorAndSpec(color: [Colors.blue], spec: ['6GB']),
                      SizedBox(height: kDefaultPaddin/2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCounter(),
                          FavButton(color: Colors.white)
                        ],
                      ),
                      SizedBox(height: kDefaultPaddin/2,),
                      AddToCartAndBuyButton()
                    ],
                  ),
                ),
                ProductTitleWithImage(name: 'Redmi Note 11', price:'\$24,999')
              ],
            ),
          )
        ],
      ),
    );
  }
}



