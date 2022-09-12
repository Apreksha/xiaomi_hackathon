import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/constants.dart';

class ProductTitleWithImage extends StatefulWidget {
  final name, price;
  const ProductTitleWithImage({Key? key, this.name, this.price}) : super(key: key);

  @override
  State<ProductTitleWithImage> createState() => _ProductTitleWithImageState(name, price);
}

class _ProductTitleWithImageState extends State<ProductTitleWithImage> {
  var name, price;
  _ProductTitleWithImageState(this.name, this.price);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              name,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              )
          ),
          SizedBox(height: kDefaultPaddin,),
          Row(
            children: [
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(text: "$price",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )),
                  ]
              )),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('photoSlider');
                    },
                    child: Image.asset('assets/images/smartphone.png', height: 250, width: 250,),
                  ))
            ],
          )
        ],
      ),
    );
  }
}