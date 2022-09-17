import 'package:flutter/material.dart';
import '../Categories/categories_main_page.dart';


class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}
List items=[
  'Smartphones',
  'Laptops',
  'Accessories',
  'Bundle Sales',
  'Smart Home',
  'TV'
];
List images =[
  "assets/images/phoneCat.png",
  "assets/images/laptopCat.png",
  "assets/images/earphoneCat.png",
  "assets/images/bagCat.png",
  "assets/images/smartHomeCat.png",
  "assets/images/tvCat.png"
];
class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index){
            return category(index,_w,_h);
          }),
    );
  }
  Widget category(int index, double _w, double _h){
    return InkWell(
      onTap: (){
        int tempInd;
        if(index == 0){
          tempInd = 7;
        }else if(index == 1){
          tempInd = 0;
        }else if(index == 4){
          tempInd = 6;
        }else if(index == 5){
          tempInd = 8;
        }else{
          tempInd=index;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriesMainPage(categoryIndex: tempInd,title: items[index],)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric( horizontal: _w/50),
        padding: EdgeInsets.symmetric(vertical: _h/65,horizontal: _w/50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(images[index]), width: _w/10,height: _w/10),
            SizedBox(
              width: _w/45,
            ),
            Text(items[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _h/50,
                  color: Colors.black
              ),)
          ],
        ),
      ),
    );
  }
}
