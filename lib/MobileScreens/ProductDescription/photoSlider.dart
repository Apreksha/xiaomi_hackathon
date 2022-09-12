import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
