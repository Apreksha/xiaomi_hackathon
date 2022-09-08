
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/Categories/categories_main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xiaomi_hackathon/Screens/Checkout/checkout.dart';
import 'package:xiaomi_hackathon/Screens/OrderHistory/order_history.dart';
import 'package:xiaomi_hackathon/Screens/PaymentSuccess/email.dart';
import 'package:xiaomi_hackathon/Screens/filladdress.dart';
import 'package:xiaomi_hackathon/Screens/payment.dart';
import 'package:xiaomi_hackathon/Screens/PaymentSuccess/payment_success.dart';
import 'package:xiaomi_hackathon/Screens/PaymentSuccess/whatsapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*SharedPreferences preferences=await SharedPreferences.getInstance();
  initScreen=(await preferences.getInt('initScreen'));
  await preferences.setInt('initScreen', 1);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Checkout()
    );
  }
}