import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Whatsapp extends StatelessWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String number='919358600733', message='j';

    return ElevatedButton(
      onPressed: () async{
        String url="https://api.whatsapp.com/send/?phone=919358600733&text&type=phone_number&app_absent=0";
        final Uri _url = Uri.parse(url);

        if (!await launchUrl(_url)) {
          throw 'Could not launch $_url';
        }
      },
      child: Text('open')
    );
  }
}
