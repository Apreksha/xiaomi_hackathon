import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Whatsapp extends StatelessWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              open(context);
            },
            child: Container(
                height: 50,
                width: 50,
                color:Colors.orange,
                child: Text('open'))
        ),
      ),
    );
  }
  void open(BuildContext context) async{
    String number='+918619547360', message='Order confirmed from Xiaomi\n';
    var url="whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('cant'),));
  }
}

