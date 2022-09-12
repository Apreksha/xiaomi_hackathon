import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/filladdress.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  Color _colorStore = Colors.orangeAccent.shade100, _colorHome = Colors.white;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left:10, top: 10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Text('Select delivery address', style: TextStyle(color: Colors.grey.shade700, fontSize: 18),),
        ),

        Ink(
          child: InkWell(
            onTap: (){
              setState(() {
                _colorStore = _colorStore == Colors.orangeAccent.shade100 ?
                Colors.white : Colors.orangeAccent.shade100;
                _colorHome = _colorHome == Colors.white ?
                Colors.orangeAccent.shade100 : Colors.white;

              });
            },
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              height: 130,
              decoration: BoxDecoration(
                  color: _colorStore,
                border: Border.all(color: Colors.black)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/work.png', height: 25, width: 25,),
                      SizedBox(width: 10,),
                      Text('MI Store', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.orange,
                        child: Text('Default'),
                      )
                    ],
                  ),
                  Text('C-25, Hari Ram Colony, Queens Road, Mahaveer Nagar\nDelhi, 405806')
                ],
              ),
            ),
          ),
        ),

        InkWell(
          onTap: (){
            setState(() {
              _colorHome = _colorHome == Colors.orangeAccent.shade100 ?
              Colors.white : Colors.orangeAccent.shade100;
              _colorStore = _colorStore == Colors.white ?
              Colors.orangeAccent.shade100 : Colors.white;
              Navigator.of(context).pushNamed('fillAddress');
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: EdgeInsets.all(15),
            height: 130,
            decoration: BoxDecoration(
                color: _colorHome,
                border: Border.all(color: Colors.black)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/home.png', height: 25, width: 25,),
                    SizedBox(width: 10,),
                    Text('Home', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(width: 10,),
                  ],
                ),
                Text('C-25, Hari Ram Colony, Queens Road, Mahaveer Nagar\nDelhi, 405806')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
