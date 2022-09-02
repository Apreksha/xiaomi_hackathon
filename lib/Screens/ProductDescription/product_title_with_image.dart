import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PhotoSlider()));
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

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({Key? key}) : super(key: key);

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.height,
      child: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Container(
                child: CarouselSlider(
                  items: [
                    Image.asset("assets/images/smartphone.png", height: 400,)
                  ],
                  options: CarouselOptions(
                    aspectRatio: 2,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
