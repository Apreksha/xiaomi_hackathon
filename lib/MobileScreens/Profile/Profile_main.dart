import 'package:flutter/material.dart';
import '../OrderHistory/order_history.dart';
import 'CardItem.dart';
import 'StackContainer.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const StackContainer(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    if(index == 1) {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderHistory()),
                    );
                    }
                  },
                  child: CardItem(index: index,)),
              shrinkWrap: true,
              itemCount: 2,
            )
          ],
        ),
      ),
    );
  }
}
