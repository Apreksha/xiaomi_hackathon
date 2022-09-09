import 'package:flutter/material.dart';

class ShowOrderDetails extends StatelessWidget {
  const ShowOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left:10, top: 10),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Text('Confirm order details', style: TextStyle(color: Colors.grey.shade700, fontSize: 18),),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black,),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text('Order ID: 5888888888888', style: TextStyle( fontSize: 17),)),
                  SizedBox(height: 12,),
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Redmi Note S5', style: TextStyle(color: Colors.black, fontSize: 15),),
                                  Text('  X 1', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                                ],
                              ),
                              Text('₹59,785', style: TextStyle(color: Colors.black, fontSize: 15),),
                            ],
                          );
                        }),
                  ),
                  //SizedBox(height: 12,),
                  showPriceDetails('Subtotal', '₹14,999'),
                  showPriceDetails('Delivery Charges', '₹0'),
                  showPriceDetails('Total', '₹14,999'),

                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10,),
                  Text('Delivery to', style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text('Customer Name', style: TextStyle(color: Colors.black, fontSize: 17),),
                      SizedBox(width: 10,),
                      Text('+32 1155887765', style: TextStyle(color: Colors.black, fontSize: 17),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('B-20, Shiv Colony, Rajputana Road, Tilak Nagar\nDelhi, 305804', style: TextStyle(color: Colors.black, fontSize: 15),)
                ],
              ),
            ),
          ],
        ),
    );
  }
  Column showPriceDetails(String heading, String price){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(heading, style: TextStyle(color: Colors.grey.shade600, fontSize: 17)),
            Text(price, style: TextStyle(color: Colors.grey.shade600, fontSize: 17))
          ],
        ),
        SizedBox(height: 12,)
      ],
    );
  }
}
