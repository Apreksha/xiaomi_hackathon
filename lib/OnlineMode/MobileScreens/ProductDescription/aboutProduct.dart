import 'package:flutter/material.dart';
class AboutProducts extends StatefulWidget {
  const AboutProducts({Key? key}) : super(key: key);

  @override
  State<AboutProducts> createState() => _AboutProductsState();
}

class _AboutProductsState extends State<AboutProducts> {
  Color border6GB = Colors.grey, border8GB = Colors.grey;
  Color container6GB = Colors.white, container8GB = Colors.white;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: _w/10,),
        const Text('Highlights',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),),
        SizedBox(height: _w/20,),
        Row(
          children: [
            Image.asset('assets/icons/ram.png', width: _w/12, height: _w/12,),
            SizedBox(width: _w/20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('RAM + ROM',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                const SizedBox(height: 5,),
                ramOptions()
              ],
            ),
          ],
        ),

        show('assets/icons/processor.png', 'Processor', 'Qualcomm Snapdragon 778G',_w),
        show('assets/icons/rearCamera.png', 'Rear Camera', '48MP + 2MP',_w),
        show('assets/icons/frontCamera.png', 'Front Camera', '16MP',_w),
        show('assets/icons/display.png', 'Display', '6.6 inch Full HD+',_w),
        show('assets/icons/battery.png', 'Battery', '5000 mAh',_w),

      ],
    );
  }

  Widget show(String iconPath, String heading, String value,double _w){
    return Column(
      children: [
        SizedBox(height: _w/30,),
        Row(
          children: [
            Image.asset(iconPath, width: _w/15, height: _w/15,),
            SizedBox(width: _w/30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700
                  ),),
                Text(value,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
              ],
            )
          ],
        ),
        const SizedBox(height: 15,)
      ],
    );
  }

  Widget ramOptions(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            setState(() {
              border6GB = Colors.orange;
              border8GB = Colors.grey;
              container6GB = Colors.orangeAccent;
              container8GB = Colors.white;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: container6GB,
              border: Border.all(color: border6GB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text('6GB + 64GB',
                style: TextStyle(
                    fontSize: 17
                ),),
            ),
          ),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: (){
            setState(() {
              border8GB = Colors.orange;
              border6GB = Colors.grey;

              container8GB = Colors.orangeAccent;
              container6GB = Colors.white;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: container8GB,
              border: Border.all(color: border8GB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text('8GB + 128GB',
                style: TextStyle(
                    fontSize: 17
                ),),
            ),
          ),
        ),
      ],
    );
  }
}