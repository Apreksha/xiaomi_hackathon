import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/constants.dart';

class AddToCartAndBuyButton extends StatefulWidget {
  const AddToCartAndBuyButton({Key? key}) : super(key: key);

  @override
  State<AddToCartAndBuyButton> createState() => _AddToCartAndBuyButtonState();
}

class _AddToCartAndBuyButtonState extends State<AddToCartAndBuyButton> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(right: kDefaultPaddin),
            width: size.width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.orange)
            ),
            child: IconButton(
            icon: Icon(Icons.shopping_cart),
              onPressed: (){},
            ),
          ),
          SizedBox(
            height: 50,
            width: size.width * 0.65,
            child: ElevatedButton(
              onPressed: (){},
              child: Text('BUY NOW',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
            ),
          )
          ],
      ),
    );
  }
}
