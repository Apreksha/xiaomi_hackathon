import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  final String address, city, state, pincode;
  const ShippingAddress({Key? key, required this.address, required this.city, required this.state,
    required this.pincode}) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  Color _colorStore = Colors.orangeAccent.shade100,
      _colorHome = Colors.white;
  String home = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          padding: EdgeInsets.all(10),
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Text('Select delivery address',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 18),),
        ),
        Ink(
          child: InkWell(
            onTap: () {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/work.png', height: 25, width: 25,),
                      SizedBox(width: 10,),
                      Text('Mi Store', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),),
                    ],
                  ),
                  Text(
                      'C-25, Hari Ram Colony, Queens Road, Mahaveer Nagar\nDelhi, 405806')
                ],
              ),
            ),
          ),
        ),

        InkWell(
          onTap: () {
            setState(() {
              _colorHome = _colorHome == Colors.orangeAccent.shade100 ?
              Colors.white : Colors.orangeAccent.shade100;
              _colorStore = _colorStore == Colors.white ?
              Colors.orangeAccent.shade100 : Colors.white;
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/home.png', height: 25, width: 25,),
                    SizedBox(width: 10,),
                    Text('Home', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(width: 10,),
                  ],
                ),
                Text('${widget.address}\n${widget.city}${widget.state}${widget
                    .pincode}')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
